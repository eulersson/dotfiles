# Dotfiles

Collection of configuration files.

| Tool                                    | Purpose                             |
| --------------------------------------- | ----------------------------------- |
| [iTerm](https://iterm2.com/)            | macOS terminal emulator.            |
| [Alacritty](https://alacritty.org/)     | Terminal emulator (cross-platform). |
| [wezterm](https://wezfurlong.org)       | Terminal emulator (cross-platform). |
| [Zsh](https://zsh.org/)                 | UNIX shell.                         |
| [Oh My Zsh](https://ohmyz.sh/)          | Zsh framework.                      |
| [tmux](https://github.com/tmux/tmux)    | Terminal multiplexer.               |
| [LunarVim](https://www.lunarvim.org/)   | Text editor, Neovim distribution.   |
| [pyenv](https://github.com/pyenv/pyenv) | Python version management.          |
| [nvm](https://github.com/nvm-sh/nvm)    | Node.js version management.         |

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
eksctl
ffmpeg
fzf
gh
go
helm
hstr
htop
jpeg
jq
k3d
kubernetes-cli
lazygit
neovim
nmap
ripgrep
skaffold
tmux
tree
wget
youtube-dl
zsh-syntax-highlighting
```

## Terminal Emulators

### iTerm

Use the test release (beta) (> 3.5.0beta24):

https://iterm2.com/downloads.html

You can use the `.itermexport` file in this repository and load the preferences from it
(Settings > General > Preferences > Load preferences ...) instead of having to do it
manually as explained as follows.

```
# Specify the preferences directory
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/iTerm"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
```

> [!NOTE]
> I explained loading from the `iTerm2 State.itermexport` but there seems to be another
> mechanism to export and import the settings by serializing them into `.plist` files,
> hence the existence of it in `iTerm/com.googlecode.iterm2.plist` > [I asked which one is best to the developer](https://gitlab.com/gnachman/iterm2/-/issues/11448)

You should review that those settings are reflected: [iTerm Settings](iTerm-settings.md).

### Alacritty

https://github.com/alacritty/alacritty?tab=readme-ov-file#installation

```
brew install --cask alacritty
```

### Alacritty Theme

https://github.com/alacritty/alacritty-theme#installation

```
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

### wezterm

```
brew install --cask wezterm
```

## Installation

Clone the dotfiles at home:

```
cd ~
git clone git@github.com:eulersson/.dotfiles
```

First install iTerm

Symlink the configs and dot files:

```
cd ~

mkdir -p $HOME/.config/themes
cd $HOME/.config
ln -s $HOME/.dotfiles/.config/themes

mkdir -p $HOME/.config/alacritty
cd $HOME/.config/alacritty
ln -s $HOME/.dotfiles/.config/alacritty/*

mkdir -p $HOME/.config/lvim
cd $HOME/.config/lvim
ln -s $HOME/.dotfiles/.config/lvim/* .

cd $HOME/.config
ln -s $HOME/.dotfiles/tmux .

cd $HOME
ln -s .dotfiles/.tmux.conf .
ln -s .dotfiles/tokyonight_storm.tmux .
ln -s .dotfiles/.wezterm.lua .
ln -s .dotfiles/*.zsh* .

mkdir ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch
cd ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch
ln -s $HOME/.dotfiles/iTerm/Scripts/AutoLaunch/*.py .
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

### tmux

https://github.com/tmux/tmux/wiki/Installing

```
brew install tmux
```

Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm):

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Now install all the tpm plugins within `tmux` with: `<C-b> I`.

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

### LunarVim

https://www.lunarvim.org/docs/installation

```
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

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
