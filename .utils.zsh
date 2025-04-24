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
