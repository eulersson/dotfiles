#
# Some On OSX, two different types of Python builds exist: a regular build and a
# framework build. In order to interact correctly with OSX through the native GUI
# frameworks, you need a framework build of Python.
#
#   https://matplotlib.org/3.1.0/faq/osx_framework.html
#

if [[ $(uname) == "Darwin" ]]; then
  function installPythonWithFramework() {
    env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install $1
  }
fi

function list_files_installed_by_pkg() {
  if [ $# -ne 1 ]; then
    echo "Usage:"
    echo "  list_files_installed_by_pkg <pkg_name>"
    return
  fi

  if [[ $(uname) == "Darwin" ]]; then
    brew list --verbose $1
  elif [ -f "/etc/debian_version" ]; then
    dpkg-query -L $1 # If not installed use `apt-file list $1`
  fi
}


function trim_audio() {
  if [[ $# -ne 4 ]]; then
    echo "Usage: trim_audio <input_file> <start_time> <end_time> <output_file>"
    return 1
  fi

  local input_file="$1"
  local start_time="$2"
  local end_time="$3"
  local output_file="$4"

  ffmpeg -i "$input_file" -ss "$start_time" -to "$end_time" -b:a 192k "$output_file"
}


function compress_images() {
  mkdir -p output && for file in *.(png|jpg|jpeg|tiff|heic|HEIC)(N); do
    convert "$file" -resize 1200x1200\> -quality 65 "output/${file%.*}.jpg"
  done
}

# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}

# Instagram Processors:
#
# Assumes an output of aspect ratio 3:2, which is the shape that most cameras
# shoot at. The first instagram image of the caroussel determines the shape.
#
processVerticalVideoForInstagram() {
  cmd="ffmpeg -i \"$1\" -lavfi \"\
    [0:v]scale=1620:-1[bg];\
    [0:v]scale=-1:1080[ov];\
    [bg][ov]overlay=(W-w)/2:(H-h)/2,crop=w=1620:h=1080\
  \" \"${1%.mov}ig.mp4\""
  echo $cmd
  eval $cmd
}
processHorizontalVideoForInstagram() {
  cmd="ffmpeg -i \"$1\" -lavfi \"\
    [0:v]scale=-1:1080[bg];\
    [0:v]scale=1620:-1[ov];\
    [bg][ov]overlay=(W-w)/2:(H-h)/2,crop=w=1620:h=1080\
  \" \"${1%.mov}ig.mp4\""
  echo $cmd
  eval $cmd
}

to_simple_mp3() {
  if [ $# -lt 1 ]; then
    echo "Usage: whatsapp_like_video_compress input.mov"
    return 1
  fi

  local input="$1"
  local basename="${input%.*}"

  ffmpeg -i "$input" -b:a 192k -ac 1 "$basename.mp3"
}

whatsapp_like_video_compress() {
  if [ $# -lt 1 ]; then
    echo "Usage: whatsapp_like_video_compress input.mov [extension]"
    return 1
  fi

  local input="$1"
  local dir="${input:h}"                # Input file's directory
  local filename="${input:t}"          # Input file's name
  local basename="${filename%.*}"      # Strip extension
  local extension="${2:-${filename##*.}}"  # Use second arg or original extension

  local output_dir="${dir}/compressed"
  mkdir -p "$output_dir"

  local output="${output_dir}/${basename}.${extension}"

  ffmpeg -i "$input" \
    -vf "scale='if(gt(iw,ih),-2,480)':'if(gt(iw,ih),480,-2)'" \
    -metadata:s:v rotate=0 \
    -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p -b:v 1200k \
    -c:a aac -b:a 62k -ar 44100 -ac 2 \
    -movflags +faststart \
    "$output"
}

# Running tests upon file changes.
watchRunTest() {
 cmd="ulimit -n 10240 && \
   find . -name \*.go | \
   entr sh -c ' \
     echo \">>>>>>>>>>>>>>>>>>>\" && \
     go test -run=\"$2\" ./$1 && \
     echo \">>>>>>>>>>>>>>>>>>>\"'"
  echo $cmd
  eval $cmd
}

# fkill-port - kill processes listening on specified ports (default: 3000-3005)
# Usage: fkill-port [ports...]
# Examples: fkill-port 3000 3001
#           fkill-port 3000-3005
#           fkill-port 3000-3002 8080 9000-9002
fkill-port() {
  local pids
  local ports=()
  
  # Parse arguments to expand ranges
  if [ $# -gt 0 ]; then
    for arg in "$@"; do
      if [[ "$arg" =~ ^([0-9]+)-([0-9]+)$ ]]; then
        # It's a range like 3000-3005
        local start="${match[1]}"
        local end="${match[2]}"
        for ((i=$start; i<=$end; i++)); do
          ports+=($i)
        done
      else
        # It's a single port
        ports+=($arg)
      fi
    done
  else
    # Default range
    ports=(3000 3001 3002 3003 3004 3005)
  fi
  
  # Get all processes listening on specified ports
  local processes=""
  for port in "${ports[@]}"; do
    local port_info=$(lsof -i :$port | grep LISTEN 2>/dev/null)
    if [ -n "$port_info" ]; then
      # Add port number to the beginning of each line for clarity
      while IFS= read -r line; do
        processes="${processes}[Port $port] $line\n"
      done <<< "$port_info"
    fi
  done
  
  if [ -z "$processes" ]; then
    echo "No processes found listening on ports: ${ports[@]}"
    return 0
  fi
  
  # Show processes and let user select with fzf
  # The PID is in field 4 after adding [Port XXXX] prefix
  local selected=$(echo -e "$processes" | \
    fzf -m --header="Select process(es) to kill (TAB for multi-select, ENTER to confirm)" \
    --preview='pid=$(echo {} | awk "{print \$4}"); echo "Process details:"; ps -p $pid -o pid,ppid,user,comm,args 2>/dev/null' \
    --preview-window=down:3:wrap)
  
  if [ -n "$selected" ]; then
    # Extract PIDs (field 4) and process names (field 3)
    pids=$(echo "$selected" | awk '{print $4}' | sort -u)
    
    # Show what we're killing
    echo "Killing the following processes:"
    echo "$selected" | while IFS= read -r line; do
      local pid=$(echo "$line" | awk '{print $4}')
      local cmd=$(echo "$line" | awk '{print $3}')
      local port=$(echo "$line" | awk -F'[][]' '{print $2}')
      echo "  - PID $pid ($cmd) on $port"
    done
    
    # Kill the processes
    echo $pids | xargs kill -9
    echo "Done!"
  else
    echo "No processes selected"
  fi
}
