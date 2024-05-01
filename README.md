# Dotfiles

Collection of configuration files for the following environment:

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

## Installation

With your current terminal emulator and shell clone the repository at your home:

```
cd ~
git clone git@github.com:eulersson/.dotfiles
```

Symlink the configs and dot files:

```
cd ~

mkdir -p .config/alacritty
ln -s .dotfiles/.config/alacritty/* .config/alacritty/

mkdir -p .config/lvim
ln -s .dotfiles/.config/lvim/* .config/lvim/

ln -s .dotfiles/.tmux.conf
ln -s .dotfiles/.wezterm.lua
ln -s .dotfiles/*.zsh*
```

### Environment Files

I have an environment file `~/.env` which has sensitive information for the tools to
work, for instance `OPENAI_API_TOKEN` so the `ChatGPT.nvim` plugin works well.

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

Now make `zsh` your default shell as explained
[here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default):

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

### Secrets

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

We will use the `JetBrainsMono Nerd Font` from
[nerdfonts.com](https://www.nerdfonts.com), so make sure you installed it:

```
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
```

Install Alacritty, a replacement for the native Terminal or iTerm2 macOS emulators.

**macOS**:

```
brew install --cask alacritty
```

**Arch Linux**
(https://github.com/alacritty/alacritty/blob/master/INSTALL.md#arch-linux)

```
pacman -S cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python
cargo install alacritty
```

**Debian / Ubuntu**
(https://github.com/alacritty/alacritty/blob/master/INSTALL.md#debianubuntu)

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

### wezterm

**macOS**:

```
brew install --cask wezterm
```

**Linux**:

https://wezfurlong.org/wezterm/install/linux.html

### tmux

Now open the newly installed Alacritty terminal emulator app and let's configure `tmux`
as explained in the
[official installation guide](https://github.com/tmux/tmux/wiki/Installing):

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

## Markdown

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

https://www.youtube.com/watch?v=BCuyEdDQ5iA https://github.com/rizsotto/Bear

Neovim's LSP for C++ uses a JSON file that has information on how to build the source
files. This file can be built using **Bear** (or if using CMake, then exporting CMAKE )

## Most Used Keyboard Shortcuts

## Alacritty

| Keys                   | Action                        |
| ---------------------- | ----------------------------- |
| Control y              | Clear history                 |
| Control Shift o        | Make window semi-transparent. |
| Control Shift p        | Make window opaque.           |
| Control Shift m        | Toggle window full screen.    |
| Control Shift n        | Create new window.            |
| Control Shift h        | Minimize window.              |
| Control f h            | Search across window.         |
| Shift Left Mouse Click | Open a link.                  |

## iTerm

| Keys  | Action                                         |
| ----- | ---------------------------------------------- |
| ⌘ + U | Toggle transparency.                           |
| ⌘ + / | Show position of cursor. Hold to make it stay. |

### Configuring iTerm

You can use the `.itermexport` file in this repository and load the preferences from it
(Settings > General > Preferences > Load preferences ...) instead of having to do it
manually as explained as follows.

> [!NOTE] Importing the .itermexport file does not seem to work very well (it's in beta,
> I filed an [issue](https://gitlab.com/gnachman/iterm2/-/issues/11343) for it)...
> Another possible way to load the preferences is as explained in
> [this article](https://shyr.io/blog/sync-iterm2-configs), running on your shell:

```
# Specify the preferences directory
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/iTerm"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
```

- [ ] General
  - [ ] Selection
    - [ ] Applications in terminal may access clipboard: ON
- [ ] Configure thems:
  - [ ] Dark: Catppuccin Mocha
  - [ ] Light: Github Light Default
- [ ] Font: JetBrains Nerd Font
- [ ] Appearance
  - [ ] General
    - [ ] Theme: Minimal
  - [ ] Windows
    - [ ] Show window number in title bar: OFF
  - [ ] Pane
    - [ ] Side margin: 10
    - [ ] Top and bottom margins: 10
- [ ] Profiles
  - [ ] Window
    - [ ] Custom window title: (leave empty!)
  - Terminal
    - Environment: Use custom locale...
      - Change...
      - English (United States) UTF-8
  - [ ] Terminal
    - [ ] Show mark indicators: OFF
- [ ] Advanced
  - [ ]

Now duplicate the profile and call it “Hotkey Profile”. Go to

- [ ] Profiles
  - [ ] General
    - [ ] Basics
      - [ ] Name: Hotkey Profile
  - [ ] Keys
    - [ ] A hotkey opens a dedicated window with this profile: ON
      - [ ] Option + Space
  - [ ] Window
    - [ ] Transparency: 15
    - [ ] Style: Full Screen

## tmux

https://tmuxcheatsheet.com/

| Keys                    | Action                                                         |
| ----------------------- | -------------------------------------------------------------- |
| Control y               | Clear history.                                                 |
| Control + b ↑           | Resize panel.                                                  |
| Control + b ↓           | Resize panel.                                                  |
| Control + b ←           | Resize panel.                                                  |
| Control + b →           | Resize panel.                                                  |
| Control + b q           | See panel numbers.                                             |
| Control + b "           | Split vertically.                                              |
| Control + b %           | Split horizontally.                                            |
| Control + b w           | List windows visually.                                         |
| Shift + Click-drag, ⌘ C | Select and copy (useful over vim sessions on remote machines). |

## LunarVim

- https://www.lunarvim.org/docs/beginners-guide/keybinds-overview

Explore the help pages:

- For commands: e.g. `:help :NvimTreeOpen`
- For NeoVim functions: e.g. `:help `

### General

| Keys                                  | Action                                               |
| ------------------------------------- | ---------------------------------------------------- |
| Space /                               | Comment current file.                                |
| Space g d                             | Show git diff in two panels.                         |
| Ctrl + Shift + ↑                      | Move line up.                                        |
| Ctrl + Shift + ↓                      | Move line down.                                      |
| Space s k                             | See current mapped keys. (also `:verbose map <TAB>`) |
| Ctrl + G                              | Print current file path.                             |
| :help                                 | Index of help files.                                 |
| :help CTRL-W_t                        | Help about a key combination.                        |
| :help :NvimTreeOpen                   | Help about a command.                                |
| :help telescope.actions.open_qflist() | Help about an nvim function.                         |
| (visual mode) :sort                   | Sort lines in visual mode.                           |
| (visual mode) gw                      | Hard wrap or reflow selected text                    |
| :SnipRun                              | Run snippet of code.                                 |

### Navigation

| Keys                         | Action                                    |
| ---------------------------- | ----------------------------------------- |
| :help various-motions        | Useful keys to navigate around vim.       |
| Ctrl + o                     | Go to previous mark.                      |
| Ctrl + i                     | Go to next mark.                          |
| Ctrl + t                     | Go to previous tag from tag stack.        |
| Space e                      | Toggle explorer.                          |
| Space f                      | Find files by file name.                  |
| Space s t                    | Search text across project.               |
| Space s h                    | Search text across help.                  |
| Space b b                    | Go to previous buffer.                    |
| Space b n                    | Go to next                                |
| Space l f                    | Format current file.                      |
| Space l x                    | Open symbols outline.                     |
| Alt/Option + ↑               | Resize panel.                             |
| Alt/Option + ↓               | Resize panel.                             |
| Alt/Option + ←               | Resize panel.                             |
| Alt/Option + →               | Resize panel.                             |
| Ctrl + n, n, n, ..., d       | `mg979/vim-visual-multi` Multiple cursor. |
| Ctrl + v, ↓, ↓, ..., Shift i | Multi-line insert.                        |
| Ctrl + W, \_                 | Maximize split within the current window. |
| Ctrl + W, =                  | Resizes all windows to equal size         |
| Ctrl + W, T                  | Move split into a separate tab maximized. |
| g t                          | Move to next tab (not buffer).            |
| g T                          | Move to next tab (not buffer).            |
| 3 g T                        | Move to tab number 3.                     |
| (on help page link) Ctrl ]   | Follow link.                              |
| (in NvimTree) g ?            | Get help.                                 |
| (in NvimTree) Ctrl V         | Open file in vertical split.              |
| (in NvimTree) Ctrl Y         | Copy current file relative path.          |
| (in symbols outline) l       | Unfold lower hierarchy.                   |
| (in symbols outline) h       | Fold lower hierarchy.                     |

### Telescope

https://github.com/nvim-telescope/telescope.nvim#default-mappings

| Keys                    | Action                                        |
| ----------------------- | --------------------------------------------- |
| (in telescope) Ctrl + t | Open result in a new tab.                     |
| (in telescope) Ctrl + v | Open result in a vertical split.              |
| (in telescope) Ctrl + h | Open result in a horizontal split.            |
| (in telescope) Ctrl + q | Open in new pane a selector of all the files. |

### LSP

| Keys                                | Action                                            |
| ----------------------------------- | ------------------------------------------------- |
| K                                   | Hover information (double K to get inside).       |
| gd                                  | Go to definition.                                 |
| gt                                  | Go to type definition.                            |
| Ctrl + t                            | Go to previous tag from tag stack.                |
| gD                                  | Go to declaration.                                |
| gr                                  | Go to references.                                 |
| gI                                  | Go to implementation.                             |
| q                                   | Close the panel that opens up on "Go to" actions. |
| gs                                  | Show signature help.                              |
| gl                                  | Show line diagnostics.                            |
| Space l w                           | Show all diagnostics (telescope).                 |
| (in telescope diagnostics) Ctrl + q | Go to quickfix view.                              |
| Space l 1                           | Show all diagnostics (quickfix).                  |
| gl gl                               | Move cursor to line diagnostics.                  |
| Space l a                           | Code action.                                      |

## Visual Studio Code

| Keys                            | Action                                            |
| ------------------------------- | ------------------------------------------------- |
| Ctrl + m                        | Maximize current panel                            |
| Ctrl + h                        | Navigate to the upper panel.                      |
| Ctrl + j                        | Navigate to the lower panel.                      |
| Ctrl + h                        | Navigate to the left panel.                       |
| Ctrl + l                        | Navigate to the right panel.                      |
| ⌘ + <number> // Ctrl + <number> | Go to the nth tab.                                |
| ⌘ + B // Ctrl + B               | Show/hide left sidebar.                           |
| ⌘ + J // Ctrl + J               | Show/hide lower panel.                            |
| Ctrl + Space                    | Force suggested autocompletion on current symbol. |
| ⌥ + F5 // Alt + F5              | Jump to the next git change.                      |
| ⌥ + F5 // Alt + F5              | Jump to the next git change.                      |
| ⇧ + ⌥ + F5 // ⇧ + Alt + F5      | Jump to the next git change.                      |
| ⇧ + ⌥ + F // ⇧ + Alt + F        | Format current file.                              |
| ⇧ + ⌘ + [ // ⇧ + Ctrl + [       | Switch to previous terminal group.                |
| ⇧ + ⌘ + ] // ⇧ + Ctrl + ]       | Switch to next terminal group.                    |

## TODO

See the [TODOs](TODO.md) document.
