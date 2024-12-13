source $HOME/.environment.zsh
source $HOME/.utils.zsh
source $HOME/.aliases.zsh

# Unbind history commands bound by jeffreytse/zsh-vi-mode so fzf history can be
# triggered with ^R.
# https://github.com/jeffreytse/zsh-vi-mode/blob/cd730cd347dcc0d8ce1697f67714a90f07da26ed/zsh-vi-mode.zsh#L3472
bindkey -r '^R' # history-incremental-search-backward
bindkey -r '^S' # history-incremental-search-forward
bindkey -r '^P' # up-line-or-history
bindkey -r '^N' # down-line-or-history

source $(brew --prefix)/share/antigen/antigen.zsh
antigen bundle agkozak/zsh-z
antigen bundle jeffreytse/zsh-vi-mode
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# No need to switch to vi keybindings if using jeffreytse/zsh-vi-mode
# bindkey -v

# Redundant since sourcing antigen already sets it but leaving it in case
# antigen were not used.
# autoload -Uz compinit
# compinit

# Interactive way of moving through selectable choices given by completions.
zstyle ':completion:*' menu select

# -- HSTR ------------------------------------------------------------------------------
#
#   Project:
#     https://github.com/dvorka/hstr
#
#   Install:
#     brew install hstr
#
alias hh=hstr              # hh to be alias for hstr
setopt histignorespace     # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor # get more colors
export HSTR_TIOCSTI=y

# The plugin will auto execute this zvm_after_init function
function zvm_after_init() {
  # -- fzf ------------------------------------------------------------------------------
  # Set up fzf key bindings and fuzzy completion.
  source <(fzf --zsh)

  # Bind UP and DOWN arrows to search through history based on the typed prefix.
  bindkey "^[[A" history-search-backward # Arrow Up
  bindkey "^[[B" history-search-forward  # Arrow Down
}

# -- starship -------------------------------------------------------------------------
eval "$(starship init zsh)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/ramon/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
