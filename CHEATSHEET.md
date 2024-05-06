## Cheat Sheet

### zsh

| Alias                                       | Description                                                          |
| ------------------------------------------- | -------------------------------------------------------------------- |
| installPythonWithFramework <python-version> | Uses pyenv to install Python alongside its `.framework` package file |
| gh                                          | GitHub Copilot                                                       |

### tmux

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

### iTerm

| Keys  | Action                                         |
| ----- | ---------------------------------------------- |
| ⌘ + U | Toggle transparency.                           |
| ⌘ + / | Show position of cursor. Hold to make it stay. |

### Alacritty

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

### LunarVim

- https://www.lunarvim.org/docs/beginners-guide/keybinds-overview

Explore the help pages:

- For commands: e.g. `:help :NvimTreeOpen`
- For NeoVim functions: e.g. `:help `

#### General

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
| :E                                    | Open file system navigator.                          |

#### Navigation

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

#### Telescope

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

### Visual Studio Code

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
