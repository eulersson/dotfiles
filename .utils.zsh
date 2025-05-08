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
    echo "Usage: whatsapp_like_video_compress input.mov"
    return 1
  fi

  local input="$1"
  local dir="${input:h}"                # Input file's directory
  local filename="${input:t}"          # Input file's name
  local basename="${filename%.*}"      # Strip extension
  local extension="${filename##*.}"    # Just the extension

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
