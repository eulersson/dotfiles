#!/bin/sh

# Detect the appearance mode passed from dark-notify
MODE="$1"

# Choose the correct theme file based on light or dark mode
if [ "$MODE" = "dark" ]; then
  THEME_PATH=$(cat ~/.config/alacritty/theme-dark.txt)
  LAZYGIT_THEME="tokyonight_storm"
  DELTA_MODE="dark"
else
  THEME_PATH=$(cat ~/.config/alacritty/theme-light.txt)
  LAZYGIT_THEME="tokyonight_day"
  DELTA_MODE="light"
fi

# Alacritty: replace the import block (single or multi-line) ending with `# theme`
/usr/local/bin/gsed -z -i "s|import = \[[^]]*\] # theme|import = [\n  \"$THEME_PATH\",\n] # theme|" ~/.config/alacritty/alacritty.toml

# LazyGit: swap theme
cp ~/.config/themes/tokyonight.nvim/extras/lazygit/${LAZYGIT_THEME}.yml ~/.config/lazygit/theme.yml

# LazyGit: swap delta --dark/--light
/usr/local/bin/gsed -i "s/delta --\(dark\|light\)/delta --${DELTA_MODE}/" ~/.config/lazygit/config.yml

# Claude Code: swap theme
/usr/local/bin/jq --arg theme "$MODE" '.theme = $theme' ~/.claude.json > ~/.claude.json.tmp && mv ~/.claude.json.tmp ~/.claude.json
