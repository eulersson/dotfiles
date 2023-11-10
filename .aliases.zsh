#!/bin/sh

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias dkcd='docker rmi $(docker images -aq -f "dangling=true")'
alias dmspindo='docker-machine create --driver digitalocean --digitalocean-access-token `cat $HOME/.tokens/.do`'
alias ff='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'


# We might need to build some tools against our version of Python, for that we need
# to install the Python.framework which provides the header

if [[ $(uname) == "Darwin" ]]; then
  # Fixes: pyenv not playing nice with brew "config".
  #
  #   https://github.com/pyenv/pyenv/issues/106
  #   https://github.com/pyenv/pyenv#homebrew-in-macos
  #
  alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

  # Some On OSX, two different types of Python builds exist: a regular build and a
  # framework build. In order to interact correctly with OSX through the native GUI
  # frameworks, you need a framework build of Python.
  #
  #   https://matplotlib.org/3.1.0/faq/osx_framework.html
  #
  function installPythonWithFramework() {
    env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install $1
  }

  # Those prepend the GNU Unix common tools like 'date' before the Apple ones.
  alias brewGnu='export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH'
  alias brewGetOpt='export PATH=$(dirname $(brew ls gnu-getopt | grep bin)):$PATH'
fi
