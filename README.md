# Dotfiles

Collection of configuration files for the following environment:

| Tool                                    | Purpose                           |
| --------------------------------------- | --------------------------------- |
| [Alacritty](https://alacritty.org/)     | Terminal emulator.                |
| [Zsh](https://zsh.org/)                 | UNIX shell.                       |
| [Oh My Zsh](https://ohmyz.sh/)          | Zsh framework.                    |
| [tmux](https://github.com/tmux/tmux)    | Terminal multiplexer.             |
| [LunarVim]()                            | Text editor, Neovim distribution. |
| [pyenv](https://github.com/pyenv/pyenv) | Python version management.        |
| [nvm](https://github.com/nvm-sh/nvm)    | Node.js version management.       |

## Installation

With your current terminal emulator and shell clone the repository at your home:

```
cd ~
git clone git@github.com:eulersson/.dotfiles
```

Symlink the configs and dot files:

```
mkdir -p ~/.config/alacritty
ln -s ~/.dotfiles/.config/alacritty/* ~/.config/alacritty/

mkdir -p ~/.config/lvim
ln -s ~/.dotfiles/.config/lvim/* ~/.config/lvim/

ln -s ~/.dotfiles/.tmux.conf
ln -s ~/.dotfiles/*.zsh*
```

### Zsh

https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

**macOS**

```
brew install zsh
```

**Debian / Ubuntu**

```
sudo apt install zsh
```

**Arch Linux**

```
pacman -S zsh
```

Now make `zsh` your default shell as explained [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default):

```
chsh -s $(which zsh)
```

### Zsh Addons

Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh#basic-installation):

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

### pyenv

**macOS** (https://github.com/pyenv/pyenv#homebrew-in-macos)

```
brew install pyenv
```

**Arch Linux / Debian / Ubuntu** (https://github.com/pyenv/pyenv#automatic-installer)

```
curl https://pyenv.run | bash
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

### Alacritty

We will use the `JetBrainsMono Nerd Font` from [nerdfonts.com](https://www.nerdfonts.com),
so make sure you installed it:

```
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
```

Install Alacritty, a replacement for the native Terminal or iTerm2 macOS emulators.

**macOS**:

```
brew install alacritty
```

**Arch Linux** (https://github.com/alacritty/alacritty/blob/master/INSTALL.md#arch-linux)

```
pacman -S cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python
cargo install alacritty
```

**Debian / Ubuntu** (https://github.com/alacritty/alacritty/blob/master/INSTALL.md#debianubuntu)

```
apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo install alacritty
```

### Alacritty Theme

https://github.com/alacritty/alacritty-theme#installation

```
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

### tmux

Now open the newly installed Alacritty terminal emulator app and let's configure `tmux`
as explained in the [official installation guide](https://github.com/tmux/tmux/wiki/Installing):

**macOS**:

```
brew install tmux
```

**Arch Linux**:

```
pacman -S tmux
```

**Debian / Ubuntu**:

```
apt install tmux
```

### Lunar Vim

First install Neovim and then Lunar Vim.

- [Installing NeoVim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- [Installing LunarVim](https://www.lunarvim.org/docs/installation)

**macOS**

```
brew install neovim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

**Arch Linux**

```
sudo pacman -S neovim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

**Ubuntu**

```
sudo apt install neovim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

## Most Used Keyboard Shortcuts

## Alacritty

| Keys                                             | Action                        |
| ------------------------------------------------ | ----------------------------- |
| <kbd>Control</kbd> <kbd>y</kbd>                  | Clear history                 |
| <kbd>Control</kbd> <kbd>Shift</kbd> <kbd>o</kbd> | Make window semi-transparent. |
| <kbd>Control</kbd> <kbd>Shift</kbd> <kbd>p</kbd> | Make window opaque.           |
| <kbd>Control</kbd> <kbd>Shift</kbd> <kbd>m</kbd> | Toggle window full screen.    |
| <kbd>Control</kbd> <kbd>Shift</kbd> <kbd>n</kbd> | Create new window.            |
| <kbd>Control</kbd> <kbd>Shift</kbd> <kbd>h</kbd> | Minimize window.              |

## tmux

https://tmuxcheatsheet.com/

| Keys                                           | Action                 |
| ---------------------------------------------- | ---------------------- |
| <kbd>Control</kbd> <kbd>y</kbd>                | Clear history.         |
| <kbd>Control</kbd> + <kbd>b</kbd> <kbd>↑</kbd> | Resize panel.          |
| <kbd>Control</kbd> + <kbd>b</kbd> <kbd>↓</kbd> | Resize panel.          |
| <kbd>Control</kbd> + <kbd>b</kbd> <kbd>←</kbd> | Resize panel.          |
| <kbd>Control</kbd> + <kbd>b</kbd> <kbd>→</kbd> | Resize panel.          |
| <kbd>Control</kbd> + <kbd>b</kbd> <kbd>q</kbd> | See panel numbers.     |
| <kbd>Control</kbd> + <kbd>b</kbd> <kbd>"</kbd> | Split vertically.      |
| <kbd>Control</kbd> + <kbd>b</kbd> <kbd>%</kbd> | Split horizontally.    |
| <kbd>Control</kbd> + <kbd>b</kbd> <kbd>w</kbd> | List windows visually. |

## LunarVim

| Keys                                                                                           | Action                                    |
| ---------------------------------------------------------------------------------------------- | ----------------------------------------- |
| <kbd>Ctrl</kbd> + <kbd>o</kbd>                                                                 | Go to previous mark.                      |
| <kbd>Ctrl</kbd> + <kbd>i</kbd>                                                                 | Go to next mark.                          |
| <kbd>Space</kbd> <kbd>/</kbd>                                                                  | Comment current file.                     |
| <kbd>Space</kbd> <kbd>e</kbd>                                                                  | Toggle explorer.                          |
| <kbd>Space</kbd> <kbd>f</kbd>                                                                  | Find files by file name.                  |
| <kbd>Space</kbd> <kbd>s</kbd>                                                                  | Search text across project.               |
| <kbd>Space</kbd> <kbd>b</kbd> <kbd>b</kbd>                                                     | Go to previous buffer.                    |
| <kbd>Space</kbd> <kbd>b</kbd> <kbd>n</kbd>                                                     | Go to next                                |
| <kbd>Space</kbd> <kbd>l</kbd> <kbd>f</kbd>                                                     | Format current file.                      |
| <kbd>Alt/Option</kbd> + ↑                                                                      | Resize panel                              |
| <kbd>Alt/Option</kbd> + ↓                                                                      | Resize panel                              |
| <kbd>Alt/Option</kbd> + ←                                                                      | Resize panel                              |
| <kbd>Alt/Option</kbd> + →                                                                      | Resize panel                              |
| <kbd>Ctrl</kbd> + <kbd>n</kbd>, <kbd>n</kbd>, <kbd>n</kbd>, ..., <kbd>d</kbd>                  | `mg979/vim-visual-multi` Multiple cursor. |
| <kbd>Ctrl</kbd> + <kbd>v</kbd>, <kbd>↓</kbd>, <kbd>↓</kbd>, ..., <kbd>Shift</kbd> <kbd>i</kbd> | Multi-line insert.                        |

**TODO**:

- Make Python DAP and test runner work.
- Make ready for Node.js and React development.
- Python testing key bindings.
- Document how to work on files that might be remote on Raspberry Pi, etc... Distant plugin vs shfs.
- distant.nvim vs sshfs cooper@neptune.local:/home/cooper /Users/ramon/mnt -o IdentityFile=~/.ssh/raspberry_local
