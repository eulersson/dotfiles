#!/bin/sh

# Detect the appearance mode passed from dark-notify
MODE="$1"

# Choose the correct theme file based on light or dark mode
if [ "$MODE" = "dark" ]; then
  THEME_PATH=$(cat ~/.config/alacritty/theme-dark.txt)
else
  THEME_PATH=$(cat ~/.config/alacritty/theme-light.txt)
fi

# Escape any special characters for sed
ESCAPED_THEME_PATH=$(printf '%s\n' "$THEME_PATH" | sed -e 's/[\/&]/\\&/g')

# Replace the line containing `# theme` with the updated import line
sed -i '' -E "s|^import = .*# theme|import = [\"$ESCAPED_THEME_PATH\"] # theme|" ~/.config/alacritty/alacritty.toml
