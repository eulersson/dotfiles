#!/bin/sh

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ff='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias chsheet='nvim ~/.dotfiles/CHEATSHEET.md'

# Docker
alias dkclean='docker rmi $(docker images -aq -f "dangling=true")'
alias dkdigioc='docker-machine create --driver digitalocean --digitalocean-access-token `cat $HOME/.tokens/.do`'

# Does not leave history trace. If you want to follow a conversation pass `--chat <id>`
alias sgptask='echo -n "> " && read question && sgpt "$(echo $question)"'

# Misc
alias dlytaudio='yt-dlp --extract-audio --audio-quality 192k --audio-format mp3 '
alias dlytpl='yt-dlp -extract-audio --audio-format mp3 --audio-quality 192k --output "%(playlist_index)s %(title)s.%(ext)s"'

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
