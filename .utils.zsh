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

function who_provides() {
  echo todo
}
