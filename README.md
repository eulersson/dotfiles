# Dotfiles

Collection of configuration files.

| Tool                                      | Purpose                           |
| ----------------------------------------- | --------------------------------- |
| [kitty](https://sw.kovidgoyal.net/kitty/) | Cross-platform terminal emulator. |
| [Zsh](https://zsh.org/)                   | UNIX shell.                       |
| [Oh My Zsh](https://ohmyz.sh/)            | Zsh framework.                    |
| [pyenv](https://github.com/pyenv/pyenv)   | Python version management.        |
| [nvm](https://github.com/nvm-sh/nvm)      | Node.js version management.       |

## Requirements

- brew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- dark-notify `brew install dark-notify`
- JetBrainsMono Nerd Font `wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip`

Install those packages with `brew install <name>`:

```
ansible
awscli
cakebrew
cmake
cormacrelf/tap/dark-notify
gnu-sed
dark-notify
eksctl
ffmpeg
fzf
gh
go
hammerspoon
helm
hstr
htop
jpeg
jq
k3d
kubernetes-cli
lazygit
middleclick
neovim
nmap
rancher
ripgrep
skaffold
tmux
tree
vlc
wget
youtube-dl
zsh-syntax-highlighting
```

## Installation

Clone the dotfiles at home:

```
cd ~
git clone git@github.com:eulersson/.dotfiles
```

Symlink the configs and dot files:

```
cd ~

mkdir -p $HOME/.config
cd $HOME/.config

ln -s $HOME/.dotfiles/.config/themes .
ln -s $HOME/.dotfiles/.config/kitty .

cd $HOME
ln -s .dotfiles/.hammerspoon .
ln -s .dotfiles/*.zsh* .
```

### hammerspoon

https://www.hammerspoon.org/

```
brew install --cask hammerspoon
```

I use hammerspoon for pressing <kbd>⌘</kbd> + <kbd>Esc</kbd> and have a kitty shell
on screen in the same fashion iTerm's hotkey window does it.

### kitty

https://sw.kovidgoyal.net/kitty/

```
brew install --cask kitty
```

### Zsh

https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

```
brew install zsh
```

Now make `zsh` your default shell as explained
[here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default):

```
chsh -s $(which zsh)
```

### Zsh Addons

https://github.com/ohmyzsh/ohmyzsh#basic-installation

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Now open a Zsh session by running `zsh` and install `zsh-syntax-highlighting` and
`zsh-completions`:

```
# Install: https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install: https://github.com/zsh-users/zsh-syntax-highlighting
brew install zsh-syntax-highlighting

# Install: https://github.com/zsh-users/zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```

### Secrets (dotenv)

Oh My Zsh has a
[dotenv plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dotenv) which
allows sourcing the environment variables defined in `.env` files on the folder tree. If
you protect those files with read-write access only to yourself it is a secure-ish way
to store API tokens and such.

Alternatives:

- Using `gpg --encrypt` and `gpg --decrypt`
- Using
  `keepassxc-cli show -sa password ~/Nuvi/MetalRose.kdbx "/Internet/OpenAI ChatGPT.nvim API Key"`

### pyenv

https://github.com/pyenv/pyenv#installation

```
brew install pyenv
```

Now you can install the latest Python version and set it as default system-wide:

```
env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.11.5
pyenv global 3.11.5
```

### nvm

https://github.com/nvm-sh/nvm#installing-and-updating

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
```

### go

```
brew install go
```

### Neovim

https://github.com/neovim/neovim/wiki/Installing-Neovim

```
brew install neovim
```

### LazyVim

https://www.lazyvim.org/

```
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

Now start `nvim` to install all the plugins.

### Visual Studio Code

https://code.visualstudio.com/

## Markdown Preview

https://github.com/joeyespo/grip

## Python Development

## The poetic way (`poetry`)

I usually install poetry on all `pyenv` distributions I have, otherwise if you install
poetry using the bash script they offer it will be tied to a particular python version.

It's useful to have the zsh completions:

```
mkdir -p ~/.zfunc
poetry completions zsh > ~/.zfunc/_poetry
```

For Python I use the [poetry](https://python-poetry.org/) for an organized way to manage
and resolve dependencies.

When installing packages with poetry it is all encapsulated in a virtual environment
managed by poetry.

```
❯ poetry env info

Virtualenv
Python:         3.11.5
Implementation: CPython
Path:           /Users/eulersson/Library/Caches/pypoetry/virtualenvs/sound-detector-oq1WgInS-py3.11
Executable:     /Users/eulersson/Library/Caches/pypoetry/virtualenvs/sound-detector-oq1WgInS-py3.11/bin/python
Valid:          True

System
Platform:   darwin
OS:         posix
Python:     3.11.5
Path:       /Users/eulersson/.pyenv/versions/3.11.5/Library/Frameworks/Python.framework/Versions/3.11
Executable: /Users/eulersson/.pyenv/versions/3.11.5/Library/Frameworks/Python.framework/Versions/3.11/bin/python3.11
```

To develop with `Neovim` having the Python LSP available these are the requirements:

- To have `pynvim` as a dev dependency in the poetry project `poetry add --dev pynvim`.
- To have a `pyrightconfig.json` pointing to the poetry virtualenv.

After having the information with `poetry env show` you can craft the
`pyrightconfig.json` at the root of the python project.

```
{
   "venv" : "sound-detector-oq1WgInS-py3.11",
   "venvPath" : "/Users/eulersson/Library/Caches/pypoetry/virtualenvs"
}
```

You can now open up `Neovim`.

## C++ Development

Neovim's LSP for C++ uses a JSON file that has information on how to build the source
files. This file can be built using **Bear** (or if using CMake, then exporting
`CMAKE_EXPORT_COMPILE_COMMANDS` )

## Cheat Sheet

See the [CHEATSHEET.md](CHEATSHEET.md) document for most common commands and key strokes.

## TODO

See the [TODO.md](TODO.md) document.
