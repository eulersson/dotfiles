source $HOME/.environment.zsh
source $HOME/.utils.zsh
source $HOME/.aliases.zsh

source /usr/local/opt/antigen/share/antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle agkozak/zsh-z
antigen apply

# -- HSTR ------------------------------------------------------------------------------
#
#   Project:
#     https://github.com/dvorka/hstr
#
#   Install:
#     brew install hstr
#
alias hh=hstr                         # hh to be alias for hstr
setopt histignorespace                # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor            # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j" # bind hstr to Ctrl-r (for Vi mode check doc)
bindkey -v

# -- fzf ------------------------------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# -- starship -------------------------------------------------------------------------
eval "$(starship init zsh)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/ramon/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
