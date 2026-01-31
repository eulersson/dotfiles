# Cheat Sheet

`✦` key is `⌃ ⌥ ⇧ ⌘` configured in mac with Karabiner-Elements

## System Wide

Have a look at System Preferences > Keyboard > Shortcuts.

| Keys                     | Action                                    |
| ------------------------ | ----------------------------------------- |
| `fn`                     | Change input language                     |
| Double-tap three fingers | Accessibility zoom (magnifier)            |
| ⌘ + h                    | Hide window                               |
| fn + h                   | Spread windows to see desktop             |
| fn + q                   | Spread windows to see desktop             |
| ⌘ + Space                | Open Raycast spotlight                    |
| ⌘ + `                    | Cycle between windows of same application |
| ⌃ + ⌘ + Space            | Open symbols and emoji picker             |

## Finder

| Keys          | Action                         |
| ------------- | ------------------------------ |
| ⌘ + ⇧ + Space | Toggle hidden files visibility |

## Raycast

Raycast doesn't read config files so those shortcuts have to be set after installing Raycast under _Raycast settings > Extensions_: _Window Management_ and _Applications_

> [!NOTE]
>
> `✦` is [Hyper Key](https://manual.raycast.com/hyperkey), in our case Caps Lock (⇪)

| Key         | Action                                                               |
| ----------- | -------------------------------------------------------------------- |
| ✦ + h/j/k/l | Move window to left/bottom/top/right of screen.                      |
| ✦ + ←/→     | Move window to desktop (space) left-right.                           |
| ✦ + f       | Make window full centered.                                           |
| ✦ + u       | Make window large size centered.                                     |
| ✦ + o       | Make window medium size centered.                                    |
| ✦ + c       | Center window.                                                       |
| ✦ + v       | (v for video) Move and resize window to upper right screen quarter.  |
| ✦ + b       | (b for below) Move and resize window to bottom right screen quarter. |

| Key   | Open app             |
| ----- | -------------------- |
| ✦ + t | Terminal (Alacritty) |
| ✦ + i | Finder               |
| ✦ + p | KeePassX             |
| ✦ + m | Mail                 |
| ✦ + x | Obsidian             |
| ✦ + a | Reminders            |
| ✦ + e | Calendar             |
| ✦ + w | Preview              |
| ✦ + r | Zen (Browser)        |

## Alacritty

- [Default bindings](https://alacritty.org/config-alacritty-bindings.html)
- Custom bindings: [.config/alacritty/alacritty.toml](.config/alacritty/alacritty.toml)
- Alacritty does not have splits nor tabs so in this setup it's paired with these [tmux configuration](#tmux).

| Keys      | Action                    |
| --------- | ------------------------- |
| ⌃ + ⇧ + m | Toggle simple full sreen  |
| ⌃ + ⇧ + n | Create new window         |
| ⌃ + ⇧ + h | Minimize window           |
| ⌃ + ⇧ + y | Clear history             |
| ⌃ + ⇧ + o | Set window opacity to 0.5 |
| ⌃ + ⇧ + p | Set window opacity to 1   |
| Super + z | Cycle font sizes          |

## Finder

| Keys      | Action                        |
| --------- | ----------------------------- |
| ⌘ + ⇧ + . | Toggle show/hide hidden files |

## LazyVim (Neovim)

<https://www.lazyvim.org/keymaps>

If you want to check all the maps you can use `:map` and search through it.

> [!NOTE] If you use `uv` for managing your Python installation and packages, every time you need to install dependencies that rely on Python, use `uv run nvim` to open Neovim so it uses the correct environment.

### Navigation

| Keys                  | Action                                                                    |
| --------------------- | ------------------------------------------------------------------------- |
| H                     | Go to left buffer                                                         |
| L                     | Go to right buffer                                                        |
| ⌥ + H                 | Move buffer leftwards in topbar                                           |
| ⌥ + L                 | Move buffer rightwards in topbar                                          |
| ⌥ + H                 | Move buffer leftwards in topbar                                           |
| ⌥ + ↑/↓               | Move line under cursor up/down                                            |
| Space ,               | List open buffers                                                         |
| Space b d             | Close buffer                                                              |
| Space s s             | Navigate to open symbols in current buffer                                |
| Space :               | Command history                                                           |
| ⌃ + i                 | Go to newer cursor position in jump list (see `:help jump-motions`)       |
| ⌃ + o                 | Go to older cursor position in jump list (see `:help jump-motions`)       |
| g c c                 | Comment current line                                                      |
| (visual) g c          | Comment block                                                             |
| (Neo-tree) ?          | Show help                                                                 |
| (Neo-tree) h          | Show hidden files                                                         |
| (Neo-tree) o          | Open with system application (useful for folders, since open with Finder) |
| (Neo-tree) e          | Grow width of panel to include all file names                             |
| ⌃ + ⇧ + ↑/↓/←/→       | Resize panel                                                              |
| ⌃ + w, \|             | Maximize window width                                                     |
| ⌃ + w, 2              | Set window to half width                                                  |
| ⌃ + w, 3              | Set window to third width                                                 |
| ⌃ + w, 4              | Set window to quarter width                                               |
| Space w m             | Toggle window zoom (maximize/restore current window)                      |
| ⌃ + e                 | Scroll text buffer down                                                   |
| ⌃ + y                 | Scroll text buffer up                                                     |
| ⌃ + f                 | Scroll viewport forward by one full screen                                |
| (symbols outline) h/l | Expand/collapse symbol child items                                        |
| Space b l/r           | Delete buffers on the `l`eft or `r`ight                                   |
| ⌃ ⇧ \_                | Toggle terminal                                                           |
| ]h                    | Jump to the next git hunk                                                 |
| [h                    | Jump to the previous git hunk                                             |
| m{a-zA-Z}             | Set mark (uppercase is global) (see `:help mark-motions`)                 |
| :delm m{a-zA-Z}       | Delete mark                                                               |
| :delm !               | Delete all marks                                                          |
| `{a-zA-Z}             | Navigate to mark (uppercase is global) (see `:help mark-motions`)         |
| Space s m             | (telescope) Select jump mark where to jump to                             |
| "                     | Show registers                                                            |
| ⌃ + /                 | Toggle floating terminal                                                  |
| (normal) s            | Search                                                                    |
| Space Tab Tab         | Create a new tab                                                          |
| Space Tab ]           | Move to right tab                                                         |
| Space Tab [           | Move to left tab                                                          |
| Space Tab d           | Close current tab                                                         |
| (Neo-tree) O          | Opens file or folder using Finder                                         |
| g f                   | Go to file under cursor                                                   |
| Space :               | (telescope) Show command history                                          |
| Space n               | Show notificatio history                                                  |

### Code Folding

| Keys | Action                                          |
| ---- | ----------------------------------------------- |
| za   | Toggle open/close code fold (recursively: `zA`) |
| zr   | Expand all outer folds (recursively: `zR`)      |
| zm   | Collapse all outer folds (recursively: `zM`)    |

### Session

| Keys      | Action                                |
| --------- | ------------------------------------- |
| Space q s | Load session for current directory    |
| Space q S | Select a session to load              |
| Space q l | Load the last session                 |
| Space q d | Stop Persistence (won't save on exit) |

### Help

| Keys      | Action                                                                  |
| --------- | ----------------------------------------------------------------------- |
| Space     | Get `which_key` plugin to show help on key maps starting with Space key |
| Space ⌫   | Get `which_key` plugin to show help on maps starting without prefix     |
| ⌃ + r     | Get `which_key` plugin to show vim registers and what's in each one     |
| Space s h | Search help pages                                                       |
| Space s M | Search man pages                                                        |
| Space s o | Search options                                                          |

### Editor

| Keys              | Action                                                                        |
| ----------------- | ----------------------------------------------------------------------------- |
| x                 | Delete character under cursor                                                 |
| (visual) U        | Convert to uppercase                                                          |
| (visual) u        | Convert to lowercase                                                          |
| ⌃ + '             | Open marks                                                                    |
| ~                 | Toggle case char under cursor                                                 |
| g u Space         | Lowercase char under cursor                                                   |
| g U Space         | uppercase char under cursor                                                   |
| ya{char}          | Copy contents inside `{char}` including `{char}`                              |
| yi{char}          | Copy contents inside `{char}` excluding `{char}`                              |
| .,$s/this/that/gI | Replace occurrences of `this` with `that` from current line until end of file |
| Space u h         | Toggle inlay hints                                                            |
| gw                | Hard wrap text (format lines to textwidth)                                    |
| J                 | Join lines (undo hard wrap by joining current line with next)                 |

### LSP

| Keys         | Action                                                                               |
| ------------ | ------------------------------------------------------------------------------------ |
| Space c s    | Open symbols outline                                                                 |
| ⌃ + Space    | Stimulate autocompletion for a candidate                                             |
| g d          | Go to definition                                                                     |
| g r          | Go to references                                                                     |
| g I          | Go to implementations                                                                |
| K            | Show documentation                                                                   |
| K K          | Enter documentation box                                                              |
| ⌥ + M        | Show function signature                                                              |
| ⌥ + M, ⌥ + M | Enter function signature box                                                         |
| Space c s    | Open symbols outline                                                                 |
| Space c r    | Rename symbol under cursor                                                           |
| Space u f    | Disable autoformat                                                                   |
| Space c f    | Format current buffer                                                                |
| Space x x    | Show diagnostics in bottom pane                                                      |
| Space u w    | Toggle word wrap                                                                     |
| Space u h    | Toggle inline hints                                                                  |
| Space u e    | Toggle status bar                                                                    |
| Space c t    | Toggle completions                                                                   |
| ]h           | Jump to the next git hunk                                                            |
| [h           | Jump to the previous git hunk                                                        |
| ]d           | Next diagnostic                                                                      |
| [d           | Previous diagnostic                                                                  |
| ]e           | Next error                                                                           |
| [e           | Previous error                                                                       |
| Space cd     | Copy diagnostic                                                                      |
| [[           | Previous occurrence of this symbol in the file or next class if cursor not in symbol |
| ]]           | Next occurrence of this symbol in the file or next class if cursor not in symbol     |
| ]f           | Jump to next function                                                                |
| ]c           | Jump to next class                                                                   |
| ]m           | Jump to next method                                                                  |
| %            | Jump to matching bracket/delimiter                                                   |
| ]}           | Jump to next unmatched }                                                             |
| ])           | Jump to next unmatched )                                                             |
| ]i           | Jump to bottom edge of scope                                                         |
| [i           | Jump to top edge of scope                                                            |
| ]z           | Move to end of current fold/indent block                                             |
| [z           | Move to start of current fold/indent block                                           |

### Tests

| Keys                                         | Action                                     |
| -------------------------------------------- | ------------------------------------------ |
| Space t r                                    | Run nearest test                           |
| Space t d                                    | Debug nearest test                         |
| Space t s                                    | Toggle summary sidebar                     |
| Space t O                                    | Show test results in permanent split below |
| Space t o (after floating test result shows) | Jumps to floating test result window       |
| (in summary sidebar) ?                       | Show help                                  |
| (in summary sidebar) r                       | Run test                                   |
| (in summary sidebar) d                       | Debug test                                 |
| (in summary sidebar) i                       | Jump into test                             |
| (in summary sidebar) o                       | See output                                 |
| (in summary sidebar) 1                       | Watch test                                 |
| (in summary sidebar) m                       | Mark test                                  |

### DAP (Debug Adapter Protocol)

| Keys      | Action      |
| --------- | ----------- |
| Space d o | Step Out    |
| Space d O | Step Over   |
| Space d P | Pause       |
| Space d r | Toggle REPL |
| Space d t | Terminate   |

### Claude Code

| Keys               | Action                                                  |
| ------------------ | ------------------------------------------------------- |
| Space a c          | Toggle Claude                                           |
| Space a f          | Focus Claude                                            |
| Space a r          | Resume Claude                                           |
| Space a C          | Continue Claude                                         |
| Space a m          | Select Claude model                                     |
| Space a b          | Add current buffer                                      |
| (visual) Space a s | Send to Claude                                          |
| ⌃ + \\ then ⌃ + n  | Switch from TERMINAL mode to NORMAL mode to select text |

### Git

| Keys      | Action                                                      |
| --------- | ----------------------------------------------------------- |
| ]h        | Jump to the next git hunk                                   |
| [h        | Jump to the previous git hunk                               |
| ghgh      | Applies hunk range under cursor                             |
| gHgh      | Reset hunk range under cursor                               |
| gh\_      | Apply current line (even if it's not a full hunk)           |
| gH\_      | Reset current line (even if it's not a full hunk)           |
| Space g g | Open up Lazy Git on the first folder upward that has a repo |
| Space g s | Open in Telescope the git files that have been changed      |
| Space g G | Open up Lazy Git from the root where you run nvim from      |
| Space g v | Open [Diffview](https://github.com/sindrets/diffview.nvim)  |
| Space g u | Copy remote git repository link to code                     |

### Diffview

Diffview opens into a tab, see the tab navigation (`Space`, `Tab`, `]`/`[`/`d`/`Tab`)

| Keys        | Action                                                            |
| ----------- | ----------------------------------------------------------------- |
| g ?         | Keymap overview                                                   |
| g, ⌃ + x    | Cycle layouts                                                     |
| Space, b    | Toggle sidebar                                                    |
| Tab         | Jumps to next file                                                |
| ⇧ Tab       | Jumps to previous file                                            |
| Space c o   | (in conflict) Choose ours                                         |
| Space c t   | (in conflict) Choose theirs                                       |
| ]x / [x     | Jump to the next/previous conflict                                |
| ]c / [c     | Jump to the next/previous change                                  |
| g f         | Open the file in the previous tabpage                             |
| ⌃ + f/b     | Scroll code forward/backward (useful to do it from files sidebar) |
| Space Tab d | Close (basically because it opened into a tab)                    |

### CodeCompanion

| Keys | Action        |
| ---- | ------------- |
| ga   | Accept change |
| gr   | Cancel change |

### LazyGit

| Keys                | Action                                                                                  |
| ------------------- | --------------------------------------------------------------------------------------- |
| ?                   | Show keyboard shortcuts for running commands                                            |
| Tab                 | Move across panes                                                                       |
| Enter               | Move through hunks to stage/reset them                                                  |
| Space               | Stage/unstage hunk/line/file                                                            |
| ⇧ + +/-             | Expand/contract current pane/section                                                    |
| ⇧ + 2               | Show/hide or focus command output log                                                   |
| 0-5                 | Move cursor to particular pane                                                          |
| d                   | Discard (reset) change                                                                  |
| p                   | Pull                                                                                    |
| c                   | Write commit message                                                                    |
| P                   | Push                                                                                    |
| W                   | View diffing options...                                                                 |
| s                   | Stash                                                                                   |
| e                   | Edit file using `$EDITOR` (Neovim in my case); finish with `:q` to get back to Lazy Git |
| o                   | Open file in new tab                                                                    |
| ⌃ + c               | Exit                                                                                    |
| (on commit) ⌃ + j/k | Rebase and shift that commit up/down Exit                                               |
| fn + ↓/↑            | Scroll buffer vertically                                                                |
| (on branch) M       | Merge that branch into current branch                                                   |
| (on branch) Space   | Check out branch                                                                        |
| (on branch) r       | Rebase selected branch into checked out branch                                          |
| (on branch) ugh     | Hard reset to upstream (when someone rebased the branch and pushed)                     |

### Telescope

| Keys                | Action                                            |
| ------------------- | ------------------------------------------------- |
| (normal mode) ?     | Show help                                         |
| (insert mode) ⌃ + / | Show help                                         |
| (insert mode) ⌃ + q | Send filtered selection to quickfix (lower panel) |

### Commands

| Command            | Action                                                         |
| ------------------ | -------------------------------------------------------------- |
| `:.,$s/foo/bar/gc` | From the current line onwards replace foo with bar             |
| `:ReloadAll`       | Reloads files from disk (useful when you change them from git) |

### Search

| Command                 | Action                                                                                                                     |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| Space s r               | Search and replace with ripgrep.                                                                                           |
| \* cw newWord . n . n . | Search and replace the current word across the entire document                                                             |
| Space /                 | Live grep with args (see [telescope-live-grep-args.nvim](https://github.com/nvim-telescope/telescope-live-grep-args.nvim)) |
| Space Space             | Find files                                                                                                                 |
| Space s S               | Search symbols across workspace.                                                                                           |

### Workflows

#### Search Replace Visual

1. Visually select the text with `v` and then movement commands.
2. Yank the selected text with `y`. That puts it on register `"`.
3. Enter command-line mode with `:`.
4. Type `.,$s/`.
5. Press ⌃-R followed by " to insert the yanked text (in insert mode ⌃-R allows to insert from register).
6. Type `/bar/gc` and press Enter.

<https://vi.stackexchange.com/a/6694>

#### Project-Wide Search and Replace

Use either LazyVim's `Space s r` or the option below.

`Space /` (live grep with args), type the regex, then open results as a quick list `⌃ + q`, then run `:cdo s/this/that/gIc` (which runs the search and replace for each entry in the quick fix list). Finally you can save all results with `:wa`.

### Troubleshooting

#### Revisit Notifications

When errors show as toasts you can run `:lua Snacks.notifier.show_history()` to revisit them.

## tmux

<https://tmuxcheatsheet.com/>

| Keys                    | Action                                           |
| ----------------------- | ------------------------------------------------ |
| ⌃ + b, ?                | Show key bindings                                |
| ⌃ + b, r                | Reload tmux config                               |
| ⌃ + ↑/↓/←/→             | Navigate panels without losing zoom state        |
| ⌃ + b, "                | Split vertically                                 |
| ⌃ + b, %                | Split horizontally                               |
| ⌃ + b, z                | Toggle zoom on current panel                     |
| ⌃ + b, {/}              | Swap panels                                      |
| ⌃ + b, q                | See panel numbers                                |
| ⌃ + b ↑/↓/←/→           | Resize panel                                     |
| ⌃ + b, ⌥ + 1/2          | Even out horizontal/vertical layout              |
| ⌃ + b, \[               | Navigate (vi-style) scroll buffer to copy bits   |
| ⌃ + b, fn + ↑           | Same as `⌃ + b, [` but scrolling buffer one page |
| ⌥ + s                   | Enter copy mode                                  |
| ⌃ + b, f                | Toggle status bar (focus mode)                   |
| ⌥ + c                   | Clear screen                                     |
| ⌃ + b, ⌃ + y            | Clear output buffer                              |
| ⌃ + b, ⌃ + l            | Clear screen (alternate method)                  |
| ⌥ + ←/→                 | Move to left/right window                        |
| ⌥ + h/l                 | Move current window left/right                   |
| ⌃ + b, w                | List windows visually                            |
| ⌃ + b, P                | Paste tmux buffer                                |
| ⌘ + v                   | Paste copied text                                |
| (copy mode) v           | Start visual selection                           |
| (copy mode) y           | Copy                                             |
| (copy mode) q           | Exit copy mode                                   |
| (copy mode) ⇧ + k       | Scroll up                                        |
| (copy mode) ⇧ + j       | Scroll down                                      |
| (copy mode) \]          | Paste copied text                                |
| ⌃ + b, I                | (tpm) Installs new plugins                       |
| ⌃ + b, U                | (tpm) Updates plugins                            |
| ⌃ + b, ⌥ + u            | (tpm) Removes plugins not in the list            |
| ⇧ + click + drag, ⌘ + C | Select and copy from tmux output buffer          |
| ⌃ + b, ,                | Rename window                                    |
| ⌃ + b, \<               | Window management context menu                   |
| ⌃ + b, \>               | Pane management context menu                     |

## zsh

| Alias                                       | Action                                                               |
| ------------------------------------------- | -------------------------------------------------------------------- |
| installPythonWithFramework <python-version> | Uses pyenv to install Python alongside its `.framework` package file |
| gh                                          | GitHub Copilot                                                       |
| ⌃ + r                                       | Browse terminal history using fuzzy search fzf                       |
| cd \*\*Tab                                  | Use fzf to fuzzy search directory to jump to                         |
| fc -AI                                      | Save history of current Zsh session                                  |

### Shell GPT

<https://github.com/TheR1D/shell_gpt>

| Command                                                                                |
| -------------------------------------------------------------------------------------- |
| sgpt "What is the fibonacci sequence"                                                  |
| git diff \| sgpt "Generate git commit message, for my changes"                         |
| docker logs -n 20 my_app \| sgpt "check logs, find errors, provide possible solutions" |
| sgpt --shell "find all json files in current folder"                                   |
| sgpt --code "solve fizz buzz problem using python"                                     |
| sgpt --code "solve classic fizz buzz problem using Python" > fizz_buzz.py              |
| cat fizz_buzz.py \| sgpt --code "Generate comments for each line of my code"           |

With the `sgptask` alias you don't leave trace in history:

```sh
$ sgptask
> what is 1 + 1?
# 1 + 1 equals 2
$ sgptask --chat conversation1
> remember my number: 4
# Got it! I'll remember that your number is 4. If you need me to recall it later, just let me know.
$ sgptask --chat conversation1
> what is my number?
# Your number is 4.
$ history | tail -n 3
# 1004  sgptask
# 1005  sgptask --chat conv1
# 1006  sgptask --chat conv1
```

You can also use all kind of redirection operators to pass input:

```sh
sgpt "summarise" < document.txt
# -> The document discusses the impact...
sgpt << EOF
What is the best way to lear Golang?
Provide simple hello world example.
EOF
# -> The best way to learn Golang...
sgpt <<< "What is the best way to learn shell redirects?"
# -> The best way to learn shell redirects is through...
```

## lnav

| Keys                  | Action                             |
| --------------------- | ---------------------------------- |
| e/E                   | Jump to previous and next error    |
| m                     | Mark log line                      |
| c                     | Copy marked log lines              |
| Tab                   | Move to files and filters sections |
| /                     | Search                             |
| :hide-fields log_time | Hide the time field                |

## Visual Studio Code

| Keys         | Action                                           |
| ------------ | ------------------------------------------------ |
| ⌃ + m        | Maximize current panel                           |
| ⌃ + h        | Navigate to the upper panel                      |
| ⌃ + j        | Navigate to the lower panel                      |
| ⌃ + h        | Navigate to the left panel                       |
| ⌃ + l        | Navigate to the right panel                      |
| ⌘ + <number> | Go to the nth tab                                |
| ⌘ + B        | Show/hide left sidebar                           |
| ⌘ + J        | Show/hide lower panel                            |
| ⌃ + Space    | Force suggested autocompletion on current symbol |
| ⌥ + F5       | Jump to the next git change                      |
| ⇧ + ⌥ + F5   | Jump to the prev git change                      |
| ⇧ + ⌥ + F    | Format current file                              |
| ⇧ + ⌘ + [    | Switch to previous terminal group                |
| ⇧ + ⌘ + ]    | Switch to next terminal group                    |
