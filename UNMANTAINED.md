# Unmantained Configurations

Abandoned tools I used along my DX journey.

```
cd ~

mkdir -p $HOME/.config
cd $HOME/.config

ln -s $HOME/.dotfiles/unmantained/.config/alacritty .
ln -s $HOME/.dotfiles/unmantained/.config/lvim .

cd $HOME
ln -s .dotfiles/unmantained/.wezterm.lua .

mkdir ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch
cd ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch
ln -s $HOME/.dotfiles/unmantained/iTerm/Scripts/AutoLaunch/*.py .
```

## iTerm

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

| Keys  | Action                                                                                                           |
| ----- | ---------------------------------------------------------------------------------------------------------------- |
| ⌘ + u | Cycle between background transparency values: opaque, translucid, clear.                                         |
| ⌘ + y | Cycle between background blur: small, medium, large (you might need window refocus (⌘ + Tab, and ⌘ + Tab again). |
| ⌘ + / | Show position of cursor. Hold to make it stay.                                                                   |

## WezTerm

```
brew install --cask wezterm
```

| Keys        | Action                      |
| ----------- | --------------------------- |
| Alt + `     | Toggle centered window.     |
| Alt + Space | Toggle fulls screen window. |

## Alacritty

```
brew install --cask alacritty
```

| Keys                   | Action                        |
| ---------------------- | ----------------------------- |
| Ctrl y                 | Clear history                 |
| Ctrl Shift o           | Make window semi-transparent. |
| Ctrl Shift p           | Make window opaquem           |
| Ctrl Shift m           | Toggle window full screen.    |
| Ctrl Shift n           | Create new window.            |
| Ctrl Shift h           | Minimize window.              |
| Ctrl f h               | Search across window.         |
| Shift Left Mouse Click | Open a link.                  |

## tmux

https://github.com/tmux/tmux/wiki/Installing

```
brew install tmux
```

```
cd $HOME
ln -s .dotfiles/.tmux.conf .
```

Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm):

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Now install all the tpm plugins within `tmux` with: `<C-b> I`.

https://tmuxcheatsheet.com/

| Keys                    | Action                                                         |
| ----------------------- | -------------------------------------------------------------- |
| Ctrl y                  | Clear history.                                                 |
| Ctrl + b ↑              | Resize panel.                                                  |
| Ctrl + b ↓              | Resize panel.                                                  |
| Ctrl + b ←              | Resize panel.                                                  |
| Ctrl + b →              | Resize panel.                                                  |
| Ctrl + b q              | See panel numbers.                                             |
| Ctrl + b "              | Split vertically.                                              |
| Ctrl + b %              | Split horizontally.                                            |
| Ctrl + b w              | List windows visually.                                         |
| Shift + Click-drag, ⌘ C | Select and copy (useful over vim sessions on remote machines). |

## LunarVim

https://www.lunarvim.org/docs/installation

```
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

- https://www.lunarvim.org/docs/beginners-guide/keybinds-overview

Explore the help pages:

- For commands: e.g. `:help :NvimTreeOpen`
- For NeoVim functions: e.g. `:help `

### General

| Keys                                  | Action                                               |
| ------------------------------------- | ---------------------------------------------------- |
| Space /                               | Comment current line.                                |
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
| :E                                    | Open file system navigator.                          |

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
| ⌥/Alt + ↑                    | Resize panel.                             |
| ⌥/Alt + ↓                    | Resize panel.                             |
| ⌥/Alt + ←                    | Resize panel.                             |
| ⌥/Alt + →                    | Resize panel.                             |
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
| (in telescope) Ctrl + / | Open available actions within picker          |

#### LSP

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
