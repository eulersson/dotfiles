# Cheat Sheet

## Kitty

| Keys                      | Action                                                         |
| ------------------------- | -------------------------------------------------------------- |
| Ctrl/⌃ + ⌥/Alt + F5       | Reload config.                                                 |
| ⌥/Alt + Space             | Full screen.                                                   |
| ⌥/Alt + `                 | Centered window large.                                         |
| ⌥/Alt + 1                 | Centered window small.                                         |
| ⌘/Super + h               | Hide.                                                          |
| ⌘/Super + ⌥/Alt + u       | Create another pane (horizontal split) within the current tab. |
| ⌘/Super + ⌥/Alt + i       | Create another pane (vertical split) within the current tab.   |
| Ctrl/⌃ + ⇧ + z            | Toggle current panel maximize.                                 |
| Ctrl/⌃ + h/j/k/l          | Jump cursor to window next in the left/top/bottom/right        |
| ⌘/Super + ⌥/Alt + ←/↓/↑/→ | Resize window in the given direction.                          |
| ⌘/Super + ⌥/Alt + q       | Reset window resizings.                                        |
| Ctrl/⌃ + ⌥/Alt + ←/↓/↑/→  | Move window in the given direction.                            |
| ⌃/Ctrl + ⇧ + ←/→          | Navigate tabs.                                                 |
| ⌥/Alt + 0/9/8/7/6/5/4     | Change the opacity and blur of the terminal background.        |
| ⌃/Ctrl + ⇧ + U            | Special character and emoji picker.                            |

| Keys                  | Action                                                        |
| --------------------- | ------------------------------------------------------------- |
| Ctrl/⌃ + ⇧ + Enter    | Create another pane within the current tab.                   |
| ⌘/Super + r           | Enter window resizing mode.                                   |
| ⌃/Ctrl + ⇧ + {number} | Places focus on the panel on <number> position in the layout. |

### Telescope

| Keys                     | Action                                             |
| ------------------------ | -------------------------------------------------- |
| (normal mode) ?          | Show help.                                         |
| (insert mode) ⌃/Ctrl + / | Show help.                                         |
| (insert mode) ⌃/Ctrl + q | Send filtered selection to quickfix (lower panel). |

## Neovim (LazyVim)

https://www.lazyvim.org/keymaps

### Navigation

| Keys                  | Action                                      |
| --------------------- | ------------------------------------------- |
| H                     | Go to left buffer.                          |
| L                     | Go to right buffer.                         |
| Space ,               | List open buffers.                          |
| Space b d             | Close buffer.                               |
| Space s s             | Navigate to open symbols in current buffer. |
| Ctrl + i              | Go to previous mark.                        |
| Ctrl + o              | Go to next mark.                            |
| g c c                 | Comment current line.                       |
| (visual) g c          | Comment block.                              |
| (NeoTree) ?           | Show help.                                  |
| (NeoTree) H           | Show hidden files.                          |
| Ctrl + ↑              | Resize panel.                               |
| Ctrl + ↓              | Resize panel.                               |
| Ctrl + ←              | Resize panel.                               |
| Ctrl + →              | Resize panel.                               |
| Ctrl + f              | Scroll forward floating box.                |
| Ctrl + b              | Scroll backward floatin gbox.               |
| (symbols outline) h/l | Expand/collapse symbol child items.         |
| Space b l/r           | Delete buffers on the `l`eft or `r`ight.    |
| Control /             | Toggle terminal.                            |

### Help

| Keys      | Action                                                                   |
| --------- | ------------------------------------------------------------------------ |
| Space     | Get `which_key` plugin to show help on key maps starting with Space key. |
| Space ⌫   | Get `which_key` plugin to show help on maps starting without prefix.     |
| Ctrl + r  | Get `which_key` plugin to show vim registers and what's in each one.     |
| Space s h | Search help pages.                                                       |
| Space s M | Search man pages.                                                        |
| Space s o | Search options.                                                          |

### Editor

| Keys | Action                         |
| ---- | ------------------------------ |
| x    | Delete character under cursor. |

### LSP

| Keys         | Action                                    |
| ------------ | ----------------------------------------- |
| Space c s    | Open symbols outline                      |
| Ctrl + Space | Stimulate autocompletion for a candidate. |
| g d          | Go to definition.                         |
| g r          | Show references.                          |
| K            | Show documentation.                       |
| K K          | Enter documentation box.                  |
| Space c s    | Open symbols outline                      |
| Space u f    | Disable autoformat.                       |
| Space x x    | Show diagnostics in bottom pane.          |
| Space u w    | Toggle word wrap.                         |
| ]d           | Next diagnostic.                          |
| [d           | Previous diagnostic.                      |
| ]e           | Next error.                               |
| [e           | Previous error.                           |

### Commands

| Command            | Action                                              |
| ------------------ | --------------------------------------------------- |
| `:.,$s/foo/bar/gc` | From the current line onwards replace foo with bar. |

#### Search Replace Visual

1. Visually select the text with `v` and then movement commands.
2. Yank the selected text with `y`. That puts it on register `"`.
3. Enter command-line mode with `:`.
4. Type `.,$s/`.
5. Press Ctrl-R followed by " to insert the yanked text (in insert mode Ctrl-R allows to insert from register).
6. Type `/bar/gc` and press Enter.

https://vi.stackexchange.com/a/6694

## zsh

| Alias                                       | Description                                                          |
| ------------------------------------------- | -------------------------------------------------------------------- |
| installPythonWithFramework <python-version> | Uses pyenv to install Python alongside its `.framework` package file |
| gh                                          | GitHub Copilot                                                       |

## Visual Studio Code

| Keys               | Action                                            |
| ------------------ | ------------------------------------------------- |
| Ctrl + m           | Maximize current panel                            |
| Ctrl + h           | Navigate to the upper panel.                      |
| Ctrl + j           | Navigate to the lower panel.                      |
| Ctrl + h           | Navigate to the left panel.                       |
| Ctrl + l           | Navigate to the right panel.                      |
| ⌘/Ctrl + <number>  | Go to the nth tab.                                |
| ⌘/Ctrl + B         | Show/hide left sidebar.                           |
| ⌘/Ctrl + J         | Show/hide lower panel.                            |
| Ctrl + Space       | Force suggested autocompletion on current symbol. |
| ⌥/Alt + F5         | Jump to the next git change.                      |
| ⌥ + F5 // Alt + F5 | Jump to the next git change.                      |
| ⇧ + ⌥/Alt + F5     | Jump to the next git change.                      |
| ⇧ + ⌥/Alt + F      | Format current file.                              |
| ⇧ + ⌘/Ctrl + [     | Switch to previous terminal group.                |
| ⇧ + ⌘/Ctrl + ]     | Switch to next terminal group.                    |
