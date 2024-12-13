# Cheat Sheet

## System Wide

Using macOS's key bindings and expanding them with
[Hammerspoon](https://www.hammerspoon.org/) automation.

| Keys                     | Action                                                              |
| ------------------------ | ------------------------------------------------------------------- |
| `fn`                     | Change input language.                                              |
| Double-tap three fingers | Accessibility zoom.                                                 |
| ⌘ + ⇧ + ←/→              | Resize and move the foused window to the left or right screen half. |
| ⌘ + ⇧ + ↑                | Expand the current window to fill screen.                           |
| ⌃ +⌥ + Space             | Toggle show/hide or launch fulled-size terminal.                    |
| ⌘ + h                    | Hide.                                                               |
| fn + h                   | Spread windows to see desktop.                                      |

## Finder

| Keys      | Action                         |
| --------- | ------------------------------ |
| ⌥ + Space | Full screen.                   |
| ⌘ + ⇧ + . | Toggle show/hide hidden files. |

## Kitty

From [kitty's keys](https://sw.kovidgoyal.net/kitty/overview/) as base and
expanding in [kitty config](.config/kitty/kitty.conf) and [Hammerspoon
config](.hammerspoon/init.lua).

| Keys                | Action                                                  |
| ------------------- | ------------------------------------------------------- |
| ⌥ + `               | Make terminal larger and centered.                      |
| ⌥ + 1               | Make terminal small and centered.                       |
| ⌘ + ⌥ + f           | Makes terminal full screen without round edges.         |
| ⌥ + 0/9/8/7/6/5/4/3 | Change the opacity and blur of the terminal background. |

| Keys            | Action                                            |
| --------------- | ------------------------------------------------- |
| ⌃ + ⌘ + ,       | Reload config.                                    |
| ⌘ + t           | New tab.                                          |
| ⇧ + ⌃ + ←/→     | Navigate tabs.                                    |
| ⌘ + ⌥ + u       | New window (horizontal split) within current tab. |
| ⌘ + ⌥ + i       | New window (vertical split) within current tab.   |
| ⌘ + ↩          | New window within current tab.                    |
| ⌃ + h/j/k/l     | Navigate window left/top/bottom/right.            |
| ⌘ + ⌥ + ←/↓/↑/→ | Resize window in the given direction.             |
| ⌃ + ⌥ + ←/↓/↑/→ | Move window in the given direction.               |
| ⌘ + ⌥ + q       | Reset window resizings.                           |
| ⌃ + ⇧ + ./,     | Move tab forward/backward.                        |
| ⌃ + ⇧ + z       | Toggle current panel maximize.                    |
| ⌘ + w           | Close tab.                                        |
| ⌘ + ⇧ + d       | Close window.                                     |
| ⌘ + r           | Enter window resizing mode.                       |
| ⇧ + ⌘ + i       | Set tab title.                                    |

| Keys      | Action                              |
| --------- | ----------------------------------- |
| ⌃ + ⇧ + u | Special character and emoji picker. |
| ⌥ + ⌘ + l | Clear contents of the terminal.     |

### Telescope

| Keys                | Action                                             |
| ------------------- | -------------------------------------------------- |
| (normal mode) ?     | Show help.                                         |
| (insert mode) ⌃ + / | Show help.                                         |
| (insert mode) ⌃ + q | Send filtered selection to quickfix (lower panel). |

## Neovim (LazyVim)

<https://www.lazyvim.org/keymaps>

### Navigation

| Keys                  | Action                                                                |
| --------------------- | --------------------------------------------------------------------- |
| H                     | Go to left buffer.                                                    |
| L                     | Go to right buffer.                                                   |
| Space ,               | List open buffers.                                                    |
| Space b d             | Close buffer.                                                         |
| Space s s             | Navigate to open symbols in current buffer.                           |
| ⌃ + i                 | Go to newer cursor position in jump list (see `:help jump-motions`).. |
| ⌃ + o                 | Go to older cursor position in jump list (see `:help jump-motions`).  |
| g c c                 | Comment current line.                                                 |
| (visual) g c          | Comment block.                                                        |
| (NeoTree) ?           | Show help.                                                            |
| (NeoTree) H           | Show hidden files.                                                    |
| ⌃ + ↑                 | Resize panel.                                                         |
| ⌃ + ↓                 | Resize panel.                                                         |
| ⌃ + ←                 | Resize panel.                                                         |
| ⌃ + →                 | Resize panel.                                                         |
| ⌃ + f                 | Scroll forward floating box.                                          |
| ⌃ + b                 | Scroll backward floatin box.                                          |
| ⌃ + e                 | Scroll text buffer down.                                              |
| ⌃ + y                 | Scroll text buffer up.                                                |
| (symbols outline) h/l | Expand/collapse symbol child items.                                   |
| Space b l/r           | Delete buffers on the `l`eft or `r`ight.                              |
| Control /             | Toggle terminal.                                                      |
| ]h                    | Jump to the next git hunk.                                            |
| [h                    | Jump to the previous git hunk.                                        |
| m{a-zA-Z}             | Set mark (uppercase is global) (see `:help mark-motions`).            |
| `{a-zA-Z}             | Navigate to mark (uppercase is global) (see `:help mark-motions`).    |
| Space s m             | (telescope) Select jump mark where to jump to.                        |
| "                     | Show registers.                                                       |
| ⌃ + /                 | Toggle floating terminal.                                             |
| (normal) s            | Search.                                                               |
| Space Tab Tab         | Create a new tab.                                                     |
| Space Tab ]           | Move to right tab.                                                    |
| Space Tab [           | Move to left tab.                                                     |
| Space Tab d           | Close current tab.                                                    |
| (Neo-tree) O          | Opens file or folder using Finder.                                    |
| g f                   | Go to file under cursor.                                              |
| Space :               | (telescope) Show command history.                                     |

### Help

| Keys      | Action                                                                   |
| --------- | ------------------------------------------------------------------------ |
| Space     | Get `which_key` plugin to show help on key maps starting with Space key. |
| Space ⌫   | Get `which_key` plugin to show help on maps starting without prefix.     |
| ⌃ + r     | Get `which_key` plugin to show vim registers and what's in each one.     |
| Space s h | Search help pages.                                                       |
| Space s M | Search man pages.                                                        |
| Space s o | Search options.                                                          |

### Editor

| Keys       | Action                         |
| ---------- | ------------------------------ |
| x          | Delete character under cursor. |
| (visual) U | Convert to uppercase.          |
| (visual) u | Convert to lowercase.          |
| ~          | Toggle case char under cursor. |
| g u Space  | Lowercase char under cursor.   |
| g U Space  | uppercase char under cursor.   |

### LSP

| Keys      | Action                                    |
| --------- | ----------------------------------------- |
| Space c s | Open symbols outline                      |
| ⌃ + Space | Stimulate autocompletion for a candidate. |
| g d       | Go to definition.                         |
| g r       | Go to references.                         |
| g I       | Go to implementations.                    |
| K         | Show documentation.                       |
| K K       | Enter documentation box.                  |
| Space c s | Open symbols outline                      |
| Space u f | Disable autoformat.                       |
| Space x x | Show diagnostics in bottom pane.          |
| Space u w | Toggle word wrap.                         |
| Space u h | Toggle inline hints.                      |
| ]d        | Next diagnostic.                          |
| [d        | Previous diagnostic.                      |
| ]e        | Next error.                               |
| [e        | Previous error.                           |

### Tests

| Keys                                         | Action                                      |
| -------------------------------------------- | ------------------------------------------- |
| Space t r                                    | Run nearest test.                           |
| Space t d                                    | Debug nearest test.                         |
| Space t s                                    | Toggle summary sidebar.                     |
| Space t O                                    | Show test results in permanent split below. |
| Space t o (after floating test result shows) | Jumps to floating test result window.       |
| (in summary sidebar) ?                       | Show help.                                  |
| (in summary sidebar) r                       | Run test.                                   |
| (in summary sidebar) d                       | Debug test.                                 |
| (in summary sidebar) i                       | Jump into test.                             |
| (in summary sidebar) o                       | See output.                                 |
| (in summary sidebar) 1                       | Watch test.                                 |
| (in summary sidebar) m                       | Mark test.                                  |

### Git

| Keys      | Action                                                      |
| --------- | ----------------------------------------------------------- |
| ]h        | Jump to the next git hunk.                                  |
| [h        | Jump to the previous git hunk.                              |
| ghgh      | Applies hunk range under cursor.                            |
| gHgh      | Reset hunk range under cursor.                              |
| gh\_      | Apply current line (even if it's not a full hunk).          |
| gH\_      | Reset current line (even if it's not a full hunk).          |
| Space g G | Open up Lazy Git.                                           |
| Space g v | Open [Diffview](https://github.com/sindrets/diffview.nvim). |

#### Diffview

Diffview opens into a tab, see the tab navigation (`Space`, `Tab`, `]`/`[`/`d`/`Tab`)

| Keys      | Action                                                             |
| --------- | ------------------------------------------------------------------ |
| g ?       | Keymap overview.                                                   |
| g, ⌃ + x  | Cycle layouts.                                                     |
| Space, b  | Toggle sidebar.                                                    |
| Space c o | (in conflict) Choose ours.                                         |
| Space c t | (in conflict) Choose theirs.                                       |
| ]x        | Jump to the next conflict.                                         |
| [x        | Jump to the previous conflict.                                     |
| g f       | Open the file in the previous tabpage.                             |
| ⌃ + f/b   | Scroll code forward/backward (useful to do it from files sidebar). |

### LazyGit

| Keys                | Action                                                                                                                                       |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| ?                   | Show keyboard shortcuts for running commands.                                                                                                |
| Tab                 | Move across panes.                                                                                                                           |
| Enter               | Move through hunks to stage/reset them.                                                                                                      |
| Space               | Stage/unstage hunk/line/file.                                                                                                                |
| ⇧ + +/-             | Expand/contract current pane/section.                                                                                                        |
| ⇧ + 2               | Show/hide or focus command output log.                                                                                                       |
| 0-5                 | Move cursor to particular pane.                                                                                                              |
| d                   | Discard (reset) change.                                                                                                                      |
| p                   | Pull.                                                                                                                                        |
| c                   | Write commit message, if you want to keep adding files press ESC and come back to it with `c`. If you close lazy git these changes are lost. |
| P                   | Push.                                                                                                                                        |
| W                   | View diffing options...                                                                                                                      |
| s                   | Stash.                                                                                                                                       |
| e                   | Edit file using `$EDITOR` (Neovim in my case); finish with `:q` to get back to Lazy Git                                                      |
| o                   | Open file in new tab.                                                                                                                        |
| ⌃ + c               | Exit.                                                                                                                                        |
| (on commit) ⌃ + j/k | Rebase and shift that commit up/down. Exit.                                                                                                  |
| fn + ↓/↑            | Scroll buffer vertically.                                                                                                                    |
| (on branch) M       | Merge that branch into current branch.                                                                                                       |
| (on branch) Space   | Check out branch.                                                                                                                            |

### Commands

| Command            | Action                                              |
| ------------------ | --------------------------------------------------- |
| `:.,$s/foo/bar/gc` | From the current line onwards replace foo with bar. |

### Search

| Command                 | Action                                                                                                                      |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| \* cw newWord . n . n . | Search and replace the current word across the entire document.                                                             |
| Space /                 | Live grep with args (see [telescope-live-grep-args.nvim](https://github.com/nvim-telescope/telescope-live-grep-args.nvim)). |
| Space Spacee            | Find files.                                                                                                                 |

#### Search Replace Visual

1. Visually select the text with `v` and then movement commands.
2. Yank the selected text with `y`. That puts it on register `"`.
3. Enter command-line mode with `:`.
4. Type `.,$s/`.
5. Press ⌃-R followed by " to insert the yanked text (in insert mode ⌃-R allows to insert from register).
6. Type `/bar/gc` and press Enter.

<https://vi.stackexchange.com/a/6694>

## zsh

| Alias                                       | Description                                                          |
| ------------------------------------------- | -------------------------------------------------------------------- |
| installPythonWithFramework <python-version> | Uses pyenv to install Python alongside its `.framework` package file |
| gh                                          | GitHub Copilot                                                       |
| ⌃ + r                                       | Browse terminal history using fuzzy search fzf.                                             |
| cd **TAB                                       | Use fzf to fuzzy search directory to jump to.                                             |

## lnav

| Keys | Action                              |
| ---- | ----------------------------------- |
| e/E  | Jump to previous and next error.    |
| m    | Mark log line.                      |
| c    | Copy marked log lines.              |
| TAB  | Move to files and filters sections. |
| /    | Search.                             |

## Visual Studio Code

| Keys         | Action                                            |
| ------------ | ------------------------------------------------- |
| ⌃ + m        | Maximize current panel                            |
| ⌃ + h        | Navigate to the upper panel.                      |
| ⌃ + j        | Navigate to the lower panel.                      |
| ⌃ + h        | Navigate to the left panel.                       |
| ⌃ + l        | Navigate to the right panel.                      |
| ⌘ + <number> | Go to the nth tab.                                |
| ⌘ + B        | Show/hide left sidebar.                           |
| ⌘ + J        | Show/hide lower panel.                            |
| ⌃ + Space    | Force suggested autocompletion on current symbol. |
| ⌥ + F5       | Jump to the next git change.                      |
| ⇧ + ⌥ + F5   | Jump to the prev git change.                      |
| ⇧ + ⌥ + F    | Format current file.                              |
| ⇧ + ⌘ + [    | Switch to previous terminal group.                |
| ⇧ + ⌘ + ]    | Switch to next terminal group.                    |
