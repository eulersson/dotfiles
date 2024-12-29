# iTerm2 Setup

Automated settings:

```sh
mkdir ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch
cd ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch
ln -s $HOME/.dotfiles/iTerm2/Scripts/AutoLaunch/*.py .
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/iTerm2"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
```

Or to set up manually:

- [ ] General
  - [ ] Selection
    - [ ] Applications in terminal may access clipboard: ON
- [ ] Configure thems:
  - [ ] Dark Mode: tokyonight_storm (from themes/tokyo-night/extras/iterm/tokyonight_day.itermcolors)
  - [ ] Light Mode: tokyonight_storm (from themes/tokyo-night/extras/iterm/tokyonight_day.itermcolors)
- [ ] Font: JetBrains Nerd Font ()
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

