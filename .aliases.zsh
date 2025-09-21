#!/bin/sh

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ff='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias chsheet='nvim ~/.dotfiles/CHEATSHEET.md'

# Docker
alias doco="docker compose"
alias dordi='docker rmi $(docker images -aq -f "dangling=true")'
alias docl='docker system prune --all --volumes'

# Does not leave history trace. If you want to follow a conversation pass `--chat <id>`
alias sgptask='echo -n "> " && read question && sgpt "$(echo $question)"'

# Misc
alias yt-dlp-mp3='yt-dlp --extract-audio --audio-format mp3 '
alias yt-dlp-mp3-pl='yt-dlp -extract-audio --audio-format mp3 --output "%(playlist_index)s %(title)s.%(ext)s"'
alias yt-dlp-sub='yt-dlp --write-subs --sub-lang "en-GB" --skip-download'

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
