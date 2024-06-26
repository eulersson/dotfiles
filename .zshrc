# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined" # set by `omz`

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  dotenv
  git
  poetry # TODO: See why it is not working.
  macos
  z
  # NOTE: If pyenv causes slow shells, investigate the pyenv-lazy zsh plugin!
  # zsh-autosuggestions ----------------------------------------------------------------
  #
  #   Project:
  #     https://github.com/zsh-users/zsh-autosuggestions
  #
  #   Install:
  #     1. Clone this repository into $ZSH_CUSTOM/plugins (by default ~/.oh-my-zsh/custom/plugins):
  #
  #       git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  #
  #     2. Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):
  #
  #       plugins=( 
  #         # other plugins...
  #         zsh-autosuggestions
  #       )
  #
  zsh-autosuggestions
  # zsh-syntax-highlighting ------------------------------------------------------------
  #
  #   Project:
  #     https://github.com/zsh-users/zsh-syntax-highlighting
  #
  #   Install:
  #     brew install zsh-syntax-highlighting
  #
  #   Install:
  #     1. Clone this repository in oh-my-zsh's plugins directory:
  #
  #       git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  #
  #     2. Activate the plugin in ~/.zshrc:
  #
  #       plugins=( [plugins...] zsh-syntax-highlighting)
  #
  zsh-syntax-highlighting  # Always to be the last.
  # zsh-vi-mode ------------------------------------------------------------------------
  #
  #   Project:
  #     https://github.com/jeffreytse/zsh-vi-mode
  #
  #   Install:
  #   As an Oh My Zsh! custom plugin
  #
  #   Clone zsh-vi-mode into your custom plugins repo
  #   
  #     git clone https://github.com/jeffreytse/zsh-vi-mode \
  #       $ZSH_CUSTOM/plugins/zsh-vi-mode
  #
  #   Then load as a plugin in your .zshrc
  #   
  #     plugins+=(zsh-vi-mode)
  #
  #   Keep in mind that plugins need to be added before oh-my-zsh.sh is sourced.
  # 
  zsh-vi-mode
)

# zsh-completions ----------------------------------------------------------------------
#
#   Project:
#     https://github.com/zsh-users/zsh-completions
#
#   Install:
#     1. Clone the repository inside your oh-my-zsh repo:
#
#         git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
#
#     2. Add it to FPATH in your .zshrc by adding the following line before source "$ZSH/oh-my-zsh.sh":
#
#         fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
#

# https://github.com/zsh-users/zsh-completions#oh-my-zsh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Initialize Oh My Zsh!
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source $HOME/.environment.zsh
source $HOME/.utils.zsh
source $HOME/.aliases.zsh

# HSTR ---------------------------------------------------------------------------------
#
#   Project:
#     https://github.com/dvorka/hstr
#
#   Install:
#     brew install hstr
#
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)

# zsh-autosuggestion -------------------------------------------------------------------
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# ZSH_AUTOSUGGEST_USE_ASYNC=true

# fzf ----------------------------------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh-vi-mode ------------------------------------------------------------------------
# 
# Until this issue is not merged...
#
#   - Yank to system clipboard #192
#     https://github.com/jeffreytse/zsh-vi-mode/pull/192 isn't merged ()
#
# ... we can work around it by redefining the `zvm_vi_yank` used by `zsh-vi-mode` as
# explained in https://github.com/jeffreytse/zsh-vi-mode/issues/19#issuecomment-1009256071
#
function zvm_vi_yank() {
	zvm_yank
	echo ${CUTBUFFER} | pbcopy
	zvm_exit_visual_mode
}

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/ramon/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
