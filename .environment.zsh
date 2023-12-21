# Default editor.
export EDITOR=lvim

# TODO: Is this needed?
# # Go language.
# export GOPATH=$HOME/go
# export GOROOT=$(brew --prefix golang)/libexec
# test -d $GOPATH || mkdir $GOPATH
# test -d $GOPATH/src/github.com || mkdir -p $GOPATH/src/github.com
export PATH=$HOME/go/bin:$PATH

# Search path.
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/sbin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/Scripts:$PATH
export PATH=$HOME/.pyenv/bin:$PATH
export PATH=$HOME/.poetry/bin:$PATH

# TODO: Review.
# Consider using pyenv-lazy (zsh plugin) if things get slow.
# export ZSH_PYENV_LAZY_VIRTUALENV=true

# Initialize pyenv.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# TODO: Review.
# # Used by weechat on OSX.
# if [[ "$(uname)" == "Darwin" ]]
# then
#   export PKG_CONFIG_PATH=/usr/local/opt/libffi/lib/pkgconfig
# fi

# For nvm, the node version manager.
# https://github.com/nvm-sh/nvm/issues/539#issuecomment-245791291
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# alias node='unalias node ; unalias npm ; nvm use default ; node $@'
# alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'

function path_remove () {
  # Delete path by parts so we can never accidentally remove sub paths
  PATH=${PATH//":$1:"/":"} # delete any instances in the middle
  PATH=${PATH/#"$1:"/} # delete any instance at the beginning
  PATH=${PATH/%":$1"/} # delete any instance in the at the end
}

# TODO: Document what this is for!
path_remove "/Applications/Little Snitch.app/Contents/Components"

# Only run once:
#
#   https://www.reddit.com/r/vim/comments/bkz81t/vimdiff_nor_nvim_d_are_working_as_an_external/
#
# git config --global diff.tool vimdiff3
# git config --global difftool.vimdiff3.path nvim
# git config --global merge.tool vimdiff3
# git config --global mergetool.vimdiff3.path nvim

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'

# For interaction with a Google Kubernetes Cluster.
#
#  https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
#
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Since many scripts from my company rely on AWS CLI commands, I don't want to be
# stopped every time an AWS CLI command runs with a paginator in place.
export AWS_PAGER=
