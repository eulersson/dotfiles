export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# Get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# Git completion
source ~/.git-completion.bash

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
fi

# Virtual environment
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_SCRIPT=$HOME/Library/Python/2.7/bin/virtualenvwrapper.sh
source $HOME/Library/Python/2.7/bin/virtualenvwrapper_lazy.sh

# Prompt
export PS1="\[\e[1;32m\]\u\[\e[m\] \[\e[1;36m\]\W\[\e[m\] \[\e[1;35m\]\`parse_git_branch\`\[\e[m\] "

# Binary search path.
export PATH=\
./node_modules/.bin:\
$HOME/Library/Python/2.7/bin:\
$HOME/local/bin:\
$PATH

# For python modules installed through Homebrew.
export PYTHONPATH=/usr/local/lib/python2.7/site-packages

# For PySide to work.
export DYLD_LIBRARY_PATH=/usr/local/lib/python2.7/site-packages/PySide

# openFrameworks path.
export OF_ROOT=$HOME/Apps/of_v0.9.8_osx_release

# For Raspberry Pi.
alias goserial='screen /dev/cu.usbserial 115200'

# Used by weechat
export PKG_CONFIG_PATH=/usr/local/opt/libffi/lib/pkgconfig
# Other aliases.
alias e='exit'
alias t='tmux'
