#!/bin/sh

# Detect the appearance mode passed from dark-notify
MODE="$1"

# Choose the correct theme file based on light or dark mode
if [ "$MODE" = "dark" ]; then
  THEME_PATH=$(cat ~/.config/alacritty/theme-dark.txt)
else
  THEME_PATH=$(cat ~/.config/alacritty/theme-light.txt)
fi

# Replace the import block (single or multi-line) ending with `# theme`
/usr/local/bin/gsed -z -i "s|import = \[[^]]*\] # theme|import = [\n  \"$THEME_PATH\",\n] # theme|" ~/.config/alacritty/alacritty.toml
