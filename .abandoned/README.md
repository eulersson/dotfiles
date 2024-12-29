# Abandoned Setups

## Brew Dependencies

```
kitty
```

## Installation

```
# Terminal emulators
ln -s $HOME/.dotfiles/.config/alacritty .
ln -s $HOME/.dotfiles/.config/ghostty .
ln -s $HOME/.dotfiles/.config/kitty .
```

## Cheat Sheet

### Ghostty

| Keys             | Action                                   |
| ---------------- | ---------------------------------------- |
| Hyper + `        | Quick terminal.                          |
| fn + f           | Full screen.                             |
| ⌘ + ⇧ + ,        | Reload config.                           |
| fn + ⌃ + ↑/↓/←/→ | Move to half portion up/down/left/right. |
| fn + ⌃ + ↑/↓/←/→ | Move to half portion up/down/left/right. |
| fn + ⌃ + ⇧ + ←/→ | Arrange last two windows left and right. |
| fn + ⌃ + ⇧ + ↑/↓ | Arrange last two windows up and down.    |
| fn + ⌃ + f       | Fill screen.                             |
| fn + ⌃ + c       | Move to centre.                          |

| Keys            | Action                     |
| --------------- | -------------------------- |
| ⌘ + D           | Split right.               |
| ⇧ + ⌘ + D       | Split down.                |
| ⌥ + ⌘ + ↑/↓/←/→ | Navigate splits.           |
| ⌃ + ⌘ + ↑/↓/←/→ | Resize split.              |
| ⌃ + ⌘ + =       | Equalize splits.           |
| ⇧ + ⌘ + ⏎       | Zoom split.                |
| ⌘ + \[/\]       | Select previos/next split. |

### Kitty

From [kitty's keys](https://sw.kovidgoyal.net/kitty/overview/) as base and
expanding in [kitty config](.config/kitty/kitty.conf):

| Keys            | Action                              |
| --------------- | ----------------------------------- |
| ⌃ + ⌘ + ,       | Reload config.                      |
| ⌃ + ⌥ + ←/↓/↑/→ | Move window in the given direction. |
| ⌘ + ⌥ + q       | Reset window resizings.             |
| ⌃ + ⇧ + ./,     | Move tab forward/backward.          |
| ⌃ + ⇧ + z       | Toggle current panel maximize.      |
| ⌘ + r           | Enter window resizing mode.         |
| ⇧ + ⌘ + i       | Set tab title.                      |

| Keys            | Action          |
| --------------- | --------------- |
| ⌘ + t           | New tab.        |
| ⇧ + ⌃ + ←/→     | Navigate tabs.  |
| ⌘ + w           | Close tab.      |
| ⌘ + ↩          | Split.          |
| ⌘ + ⌥ + u       | Split right.    |
| ⌘ + ⌥ + i       | Split down.     |
| ⌃ + h/j/k/l     | Navigate split. |
| ⌘ + ⌥ + ←/↓/↑/→ | Resize split.   |
| ⌘ + ⇧ + d       | Close split.    |

| Keys      | Action                              |
| --------- | ----------------------------------- |
| ⌃ + ⇧ + u | Special character and emoji picker. |
| ⌥ + ⌘ + l | Clear contents of the terminal.     |

### iTerm

First you need to follow the [iTerm2 Setup](iTerm2/iTerm2-setup.md).

You can use the `.itermexport` file in this repository and load the preferences from it
(Settings > General > Preferences > Load preferences ...) instead of having to do it
manually as explained as follows:

```
# Specify the preferences directory
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/iTerm2"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
```

> [!NOTE]
> I explained loading from the `iTerm2 State.itermexport` but there seems to be another
> mechanism to export and import the settings by serializing them into `.plist` files,
> hence the existence of it in `iTerm/com.googlecode.iterm2.plist` > [I asked which one is best to the developer](https://gitlab.com/gnachman/iterm2/-/issues/11448)

| Keys  | Action                                                                                                           |
| ----- | ---------------------------------------------------------------------------------------------------------------- |
| ⌘ + u | Cycle between background transparency values: opaque, translucid, clear.                                         |
| ⌘ + y | Cycle between background blur: small, medium, large (you might need window refocus (⌘ + Tab, and ⌘ + Tab again). |
| ⌘ + / | Show position of cursor. Hold to make it stay.                                                                   |
