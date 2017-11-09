export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# get current branch in git repo
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

# get current status of git repo
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

# git completion
source ~/.git-completion.bash

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
fi

# virtualenv stuff
function govenv() {
	export WORKON_HOME=$HOME/.virtualenvs
	export PROJECT_HOME=$HOME/Devel
	source /usr/local/bin/virtualenvwrapper.sh
}

export PS1="\[\e[1;32m\]\u\[\e[m\] \[\e[1;36m\]\W\[\e[m\] \[\e[1;35m\]\`parse_git_branch\`\[\e[m\] "
export PATH=/Users/ramon/Apps:./node_modules/.bin:/Users/ramon/Qt/5.8/clang_64/bin:/Users/ramon/Qt/Qt\ Creator.app/Contents/MacOS:/Applications/CMake.app/Contents/bin:/Users/ramon/local/bin:$PATH
export OF_ROOT=/Users/ramon/App/of_v0.9.8_osx_release

export PKG_CONFIG_PATH=/usr/local/Cellar/libffi/3.0.13/lib/pkgconfig/

alias goserial='screen /dev/cu.usbserial 115200'

##
# Your previous /Users/ramon/.profile file was backed up as /Users/ramon/.profile.macports-saved_2017-07-03_at_15:22:44
##

# MacPorts Installer addition on 2017-07-03_at_15:22:44: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export HFS="/Applications/Houdini/Current/Frameworks/Houdini.framework/Versions/Current/Resources/houdini"
export PYTHONPATH="$PYTHONPATH:$HFS/python2.7libs:/usr/local/lib/python2.7/site-packages"
# Finished adapting your PATH environment variable for use with MacPorts.
alias henv="HERE=$(pwd) && cd /Applications/Houdini/Houdini16.0.621/Frameworks/Houdini.framework/Versions/16.0.621/Resources/ && source houdini_setup && cd $HERE"
