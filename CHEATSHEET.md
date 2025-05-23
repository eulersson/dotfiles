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

Raycast doesn't read config files so those shortcuts have to be set after
installing Raycast under _Raycast settings > Extensions_: _Window Management_
and _Applications_

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
| ✦ + a | Arc                  |
| ✦ + i | Finder               |
| ✦ + p | KeePassX             |
| ✦ + m | Mail                 |
| ✦ + x | Obsidian             |
| ✦ + r | Reminders            |
| ✦ + e | Calendar             |
| ✦ + w | Preview              |

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

## Finder

| Keys      | Action                        |
| --------- | ----------------------------- |
| ⌘ + ⇧ + . | Toggle show/hide hidden files |

## LazyVim (Neovim)

<https://www.lazyvim.org/keymaps>

### Navigation

| Keys                  | Action                                                              |
| --------------------- | ------------------------------------------------------------------- |
| H                     | Go to left buffer                                                   |
| L                     | Go to right buffer                                                  |
| Space ,               | List open buffers                                                   |
| Space b d             | Close buffer                                                        |
| Space s s             | Navigate to open symbols in current buffer                          |
| ⌃ + i                 | Go to newer cursor position in jump list (see `:help jump-motions`) |
| ⌃ + o                 | Go to older cursor position in jump list (see `:help jump-motions`) |
| g c c                 | Comment current line                                                |
| (visual) g c          | Comment block                                                       |
| (Neo-tree) ?          | Show help                                                           |
| (Neo-tree) H          | Show hidden files                                                   |
| (Neo-tree) O          | Open with system application                                        |
| ⌃ + ↑/↓/←/→           | Resize panel                                                        |
| ⌃ + f                 | Scroll forward floating box                                         |
| ⌃ + b                 | Scroll backward floatin box                                         |
| ⌃ + e                 | Scroll text buffer down                                             |
| ⌃ + y                 | Scroll text buffer up                                               |
| (symbols outline) h/l | Expand/collapse symbol child items                                  |
| Space b l/r           | Delete buffers on the `l`eft or `r`ight                             |
| ⌃ ⇧ \_                | Toggle terminal                                                     |
| ]h                    | Jump to the next git hunk                                           |
| [h                    | Jump to the previous git hunk                                       |
| m{a-zA-Z}             | Set mark (uppercase is global) (see `:help mark-motions`)           |
| `{a-zA-Z}             | Navigate to mark (uppercase is global) (see `:help mark-motions`)   |
| Space s m             | (telescope) Select jump mark where to jump to                       |
| "                     | Show registers                                                      |
| ⌃ + /                 | Toggle floating terminal                                            |
| (normal) s            | Search                                                              |
| Space Tab Tab         | Create a new tab                                                    |
| Space Tab ]           | Move to right tab                                                   |
| Space Tab [           | Move to left tab                                                    |
| Space Tab d           | Close current tab                                                   |
| (Neo-tree) O          | Opens file or folder using Finder                                   |
| g f                   | Go to file under cursor                                             |
| Space :               | (telescope) Show command history                                    |
| zc                    | Close code fold                                                     |
| zo                    | Open code fold                                                      |

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

### LSP

| Keys      | Action                                   |
| --------- | ---------------------------------------- |
| Space c s | Open symbols outline                     |
| ⌃ + Space | Stimulate autocompletion for a candidate |
| g d       | Go to definition                         |
| g r       | Go to references                         |
| g I       | Go to implementations                    |
| K         | Show documentation                       |
| K K       | Enter documentation box                  |
| Space c s | Open symbols outline                     |
| Space u f | Disable autoformat                       |
| Space x x | Show diagnostics in bottom pane          |
| Space u w | Toggle word wrap                         |
| Space u h | Toggle inline hints                      |
| ]d        | Next diagnostic                          |
| [d        | Previous diagnostic                      |
| ]e        | Next error                               |
| [e        | Previous error                           |

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
| Space g G | Open up Lazy Git from the root where you run nvim from      |
| Space g v | Open [Diffview](https://github.com/sindrets/diffview.nvim)  |

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
| ]x          | Jump to the next conflict                                         |
| [x          | Jump to the previous conflict                                     |
| g f         | Open the file in the previous tabpage                             |
| ⌃ + f/b     | Scroll code forward/backward (useful to do it from files sidebar) |
| Space Tab d | Close (basically because it opened into a tab)                    |

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

### ChatGPT

<https://github.com/jackMort/ChatGPT.nvim?tab=readme-ov-file#interactive-popup>

| Keys    | Action                                                                    |
| ------- | ------------------------------------------------------------------------- |
| ⌃ + ⏎   | Submit                                                                    |
| ⌃ + y   | Copy last answer                                                          |
| ⌃ + o   | Toggle settings window                                                    |
| ⌃ + h   | Toggle help window                                                        |
| ⌃ + Tab | Cycle over windows                                                        |
| ⌃ + f   | Cycle over modes (center, stick to right)                                 |
| ⌃ + c   | Close chat window                                                         |
| ⌃ + p   | Toggle sessions list                                                      |
| ⌃ + u   | Scroll up chat window                                                     |
| ⌃ + d   | Scroll down chat window                                                   |
| ⌃ + k   | Copy code from last answer                                                |
| ⌃ + n   | Start new session                                                         |
| ⌃ + r   | Draft message (create message without submitting it to server)            |
| ⌃ + r   | Switch role (switch between user and assistant role to define a workflow) |
| ⌃ + s   | Toggle system message window                                              |
| ⌃ + i   | Use response as input                                                     |
| ⌃ + d   | View the diff between left and right panes and use diff-mode commands     |

### Commands

| Command            | Action                                             |
| ------------------ | -------------------------------------------------- |
| `:.,$s/foo/bar/gc` | From the current line onwards replace foo with bar |

### Search

| Command                 | Action                                                                                                                     |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| \* cw newWord . n . n . | Search and replace the current word across the entire document                                                             |
| Space /                 | Live grep with args (see [telescope-live-grep-args.nvim](https://github.com/nvim-telescope/telescope-live-grep-args.nvim)) |
| Space Spacee            | Find files                                                                                                                 |

### Search Replace Visual

1. Visually select the text with `v` and then movement commands.
2. Yank the selected text with `y`. That puts it on register `"`.
3. Enter command-line mode with `:`.
4. Type `.,$s/`.
5. Press ⌃-R followed by " to insert the yanked text (in insert mode ⌃-R allows to insert from register).
6. Type `/bar/gc` and press Enter.

<https://vi.stackexchange.com/a/6694>

## tmux

<https://tmuxcheatsheet.com/>

| Keys                    | Action                                           |
| ----------------------- | ------------------------------------------------ |
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
| ⌃ + b, ⌃ + l            | Clear screen                                     |
| ⌃ + b, y                | Clear output buffer                              |
| ⌃ + b, w                | List windows visually                            |
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
