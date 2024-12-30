#!/bin/sh

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ff='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'

# Docker
alias dkclean='docker rmi $(docker images -aq -f "dangling=true")'
alias dkdigioc='docker-machine create --driver digitalocean --digitalocean-access-token `cat $HOME/.tokens/.do`'

# Ox
alias ox='$HOME/Shadow/Work/ox/bin/ox -c $HOME/.oxrc.tui'
alias oxguibuildinstall='make app -j8 && sudo rm -rf /Applications/Ox.app && mv target/darwin_app/Ox.app /Applications/'
alias lastsixcrash='ls -t ~/.six/six_crash_report_* | head -n 1'
alias visixcrash='vi $(lastsixcrash)'
alias lastoxcrash='ls -t ~/.ox/ox_crash_report_* | head -n 1'
alias vioxcrash='vi $(lastoxcrash)'
alias lastoxextcrash='ls -t ~/.ox/.extension/ox_crash_report_* | head -n 1'
alias vilastoxextcrash='vi $(lastoxextcrash)'

alias oxbuildinstall='make app -j8 && sudo rm -rf /Applications/Ox.app && mv target/darwin_app/Ox.app /Applications/'

# Misc
alias dlytaudio='yt-dlp --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3'

# We might need to build some tools against our version of Python, for that we need
# to install the Python.framework which provides the header
if [[ $(uname) == "Darwin" ]]; then
  # Fixes: pyenv not playing nice with brew "config".
  #
  #   https://github.com/pyenv/pyenv/issues/106
  #   https://github.com/pyenv/pyenv#homebrew-in-macos
  #
  alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

  # Those prepend the GNU Unix common tools like 'date' before the Apple ones.
  alias brewGnu='export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH'
  alias brewGetOpt='export PATH=$(dirname $(brew ls gnu-getopt | grep bin)):$PATH'
fi
