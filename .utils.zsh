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

function compress_image() {
  _compress_one() {
    local file="$1"
    local temp_file="${file%.*}_temp.jpg"
    convert "$file" -resize 1200x1200\> -quality 65 "$temp_file" && mv "$temp_file" "${file%.*}.jpg" && [[ "$file" != "${file%.*}.jpg" ]] && rm "$file"
  }

  if [[ $# -gt 0 ]]; then
    for file in "$@"; do
      _compress_one "$file"
    done
  elif [[ ! -t 0 ]]; then
    while IFS= read -r file; do
      [[ -n "$file" ]] && _compress_one "$file"
    done
  else
    echo "Usage: compress_image <file>..."
    echo "       command | compress_image"
    return 1
  fi
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

# md_to_pdf - render a Markdown file to PDF via pandoc + WeasyPrint
# Mermaid code blocks are rendered as images by mermaid-filter.
# Usage: md_to_pdf <file.md> [output.pdf]
# Example: md_to_pdf docs/client/FLUX_DE_METADADES.md
# Deps:
#   brew install pandoc weasyprint
#   npm install -g mermaid-filter
md_to_pdf() {
  if [ $# -lt 1 ]; then
    echo "Usage: md_to_pdf <file.md> [output.pdf]"
    return 1
  fi

  local input="$1"
  local output="${2:-${input%.md}.pdf}"

  if ! command -v pandoc &>/dev/null; then
    echo "Error: pandoc is not installed. Run: brew install pandoc"
    return 1
  fi
  if ! command -v mermaid-filter &>/dev/null; then
    echo "Error: mermaid-filter is not installed. Run: npm install -g mermaid-filter"
    return 1
  fi
  if ! command -v weasyprint &>/dev/null; then
    echo "Error: weasyprint is not installed. Run: brew install weasyprint"
    return 1
  fi

  pandoc "$input" --filter mermaid-filter --pdf-engine=weasyprint -o "$output" && \
    echo "Created: $output"
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

# adoc_to_html - render an AsciiDoc file (with Mermaid) to HTML and open it in the browser
# Mermaid blocks are rendered by asciidoctor-kroki (uses the public kroki.io server).
# Usage: adoc_to_html <file.adoc> [output.html]
# Example: adoc_to_html internal/documentation-infrastructure/README.adoc
# Deps:
#   gem install --user-install asciidoctor asciidoctor-kroki
adoc_to_html() {
  if [ $# -lt 1 ]; then
    echo "Usage: adoc_to_html <file.adoc> [output.html]"
    return 1
  fi

  local input="$1"
  local output="${2:-${input%.adoc}.html}"

  # asciidoctor from --user-install may not be on PATH; fall back to the user gem bin
  local asciidoctor_bin="asciidoctor"
  if ! command -v asciidoctor &>/dev/null; then
    local gem_bin="$(ruby -e 'require "rubygems"; print Gem.user_dir' 2>/dev/null)/bin"
    if [ -x "$gem_bin/asciidoctor" ]; then
      asciidoctor_bin="$gem_bin/asciidoctor"
    else
      echo "Error: asciidoctor is not installed. Run: gem install --user-install asciidoctor asciidoctor-kroki"
      return 1
    fi
  fi

  "$asciidoctor_bin" -r asciidoctor-kroki "$input" -o "$output" && \
    echo "Created: $output" && \
    open "$output"
}

# compress_pdf - shrink a scanned PDF by re-encoding its pages as JPEG
#
# Meant for scans (one big image per page). It rasterises the document, so an
# embedded text layer is flattened into pixels - it warns before doing that.
# By default it also lifts the paper white point, which drops scanner grain and
# the bleed-through from the reverse side, so pages look cleaner *and* compress
# better. Use -n to keep the background untouched (photo books, artwork).
#
# Usage: compress_pdf [-p screen|ebook|print] [-d dpi] [-q quality] [-n] <input.pdf> [output.pdf]
#   -p  preset: screen = 150dpi/q70, ebook = 200dpi/q72 (default), print = 300dpi/q80
#   -d  override the dpi
#   -q  override the JPEG quality (1-100)
#   -n  no paper cleanup
#
# Example: compress_pdf book.pdf                 # 436M -> 46M on a 112-page scan
#          compress_pdf -p screen book.pdf small.pdf
#
# Deps: brew install poppler imagemagick qpdf
compress_pdf() {
  local preset="ebook" dpi="" quality="" cleanup=1
  local OPTIND opt
  local usage="Usage: compress_pdf [-p screen|ebook|print] [-d dpi] [-q quality] [-n] <input.pdf> [output.pdf]"

  while getopts "p:d:q:nh" opt; do
    case $opt in
      p) preset="$OPTARG" ;;
      d) dpi="$OPTARG" ;;
      q) quality="$OPTARG" ;;
      n) cleanup=0 ;;
      *) echo "$usage"; return 1 ;;
    esac
  done
  shift $((OPTIND - 1))

  if [ $# -lt 1 ]; then
    echo "$usage"
    return 1
  fi

  local dep
  for dep in pdfinfo pdftoppm magick qpdf; do
    if ! command -v "$dep" &>/dev/null; then
      echo "Error: $dep is not installed. Run: brew install poppler imagemagick qpdf"
      return 1
    fi
  done

  case "$preset" in
    screen) : "${dpi:=150}"; : "${quality:=70}" ;;
    ebook)  : "${dpi:=200}"; : "${quality:=72}" ;;
    print)  : "${dpi:=300}"; : "${quality:=80}" ;;
    *) echo "Error: unknown preset '$preset' (use screen, ebook or print)"; return 1 ;;
  esac

  local input="$1"
  if [ ! -f "$input" ]; then
    echo "Error: no such file: $input"
    return 1
  fi
  local output="${2:-${input%.pdf} (compressed).pdf}"

  local pages
  pages=$(pdfinfo "$input" 2>/dev/null | awk '/^Pages:/{print $2}')
  if [ -z "$pages" ]; then
    echo "Error: could not read $input - is it a valid PDF?"
    return 1
  fi

  if command -v pdffonts &>/dev/null && pdffonts "$input" 2>/dev/null | tail -n +3 | grep -q .; then
    echo "Note: this PDF carries a text layer; rasterising drops text selection and search."
  fi

  local tmp
  tmp=$(mktemp -d) || return 1

  # Paper cleanup: anything above 88% luminance becomes pure white.
  local clean=""
  [ "$cleanup" -eq 1 ] && clean="-level 0%,88%"

  echo "Compressing $pages pages at ${dpi}dpi, quality ${quality}..."
  local i n
  for i in $(seq -w 1 "$pages"); do
    n=$((10#$i))
    printf "\r  page %d/%d" "$n" "$pages"
    if ! pdftoppm -r "$dpi" -f "$n" -l "$n" -png -singlefile "$input" "$tmp/raw" 2>/dev/null \
       || ! magick "$tmp/raw.png" ${=clean} -quality "$quality" \
              -sampling-factor 4:2:0 -interlace none -strip "$tmp/pg-$i.jpg" 2>/dev/null; then
      printf "\n"
      echo "Error: failed on page $n"
      rm -rf "$tmp"
      return 1
    fi
  done
  printf "\r  %d pages rendered\n" "$pages"
  rm -f "$tmp/raw.png"

  # -density on read gives each JPEG its physical size, so the page box comes out
  # right; ImageMagick embeds the JPEGs as-is rather than re-encoding them.
  if ! magick -units PixelsPerInch -density "$dpi" "$tmp"/pg-*.jpg "$tmp/joined.pdf" 2>/dev/null; then
    echo "Error: could not assemble the PDF"
    rm -rf "$tmp"
    return 1
  fi

  if ! qpdf --linearize --object-streams=generate "$tmp/joined.pdf" "$output" 2>/dev/null; then
    cp "$tmp/joined.pdf" "$output"
  fi

  rm -rf "$tmp"
  echo "Created: $output ($(du -h "$input" | cut -f1) -> $(du -h "$output" | cut -f1))"
}
