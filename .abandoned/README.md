# Abandoned Setups

## Brew Dependencies

```
alacritty
```

## Installation

```
# Terminal emulators
ln -s $HOME/.dotfiles/.abandoned/alacritty $HOME/.config/alacritty
ln -s $HOME/.dotfiles/.abandoned/ghostty   $HOME/.config/ghostty
```

If you want to reuse Alacritty's dark/light launch agent, run:

```
./alacritty/create-launch-agent.sh
```

## Cheat Sheet

### Alacritty

- [Default bindings](https://alacritty.org/config-alacritty-bindings.html)
- Custom bindings: [alacritty/alacritty.toml](alacritty/alacritty.toml)
- Alacritty does not have splits nor tabs so in this setup it's paired with tmux.

| Keys      | Action                    |
| --------- | ------------------------- |
| ⌃ + ⇧ + m | Toggle simple full sreen  |
| ⌃ + ⇧ + n | Create new window         |
| ⌃ + ⇧ + h | Minimize window           |
| ⌃ + ⇧ + y | Clear history             |
| ⌃ + ⇧ + o | Set window opacity to 0.5 |
| ⌃ + ⇧ + p | Set window opacity to 1   |
| Super + z | Cycle font sizes          |

### Ghostty

| Keys             | Action                                   |
| ---------------- | ---------------------------------------- |
| Hyper + `        | Quick terminal.                          |
| fn + f           | Full screen.                             |
| ⌘ + ⇧ + ,        | Reload config.                           |
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
