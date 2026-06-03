#!/bin/sh

# Detect the appearance mode passed from dark-notify
MODE="$1"

# Choose the correct theme file based on light or dark mode
if [ "$MODE" = "dark" ]; then
  THEME_PATH=$(cat ~/.config/kitty/theme-dark.txt)
  LAZYGIT_THEME="tokyonight_storm"
  DELTA_MODE="dark"
else
  THEME_PATH=$(cat ~/.config/kitty/theme-light.txt)
  LAZYGIT_THEME="tokyonight_day"
  DELTA_MODE="light"
fi

# Kitty: replace the `include` line immediately following the `# THEME`
# marker, then reload running instances. Inline comments on kitty `include`
# lines are interpreted as part of the path, hence the separate marker.
/usr/local/bin/gsed -i "/^# THEME$/{n;s|^include .*|include $THEME_PATH|;}" ~/.config/kitty/kitty.conf

# Kitty appends its PID to the `listen_on` socket path (e.g. /tmp/mykitty-1234),
# so loop over all live sockets and reload each instance.
for sock in /tmp/mykitty-*; do
  [ -S "$sock" ] || continue
  /usr/local/bin/kitten @ --to "unix:$sock" load-config 2>/dev/null
done

# LazyGit: swap theme
cp ~/.config/themes/tokyonight.nvim/extras/lazygit/${LAZYGIT_THEME}.yml ~/.config/lazygit/theme.yml

# LazyGit: swap delta --dark/--light
/usr/local/bin/gsed -i "s/delta --\(dark\|light\)/delta --${DELTA_MODE}/" ~/.config/lazygit/config.yml

# Claude Code: swap theme
/usr/local/bin/jq --arg theme "$MODE" '.theme = $theme' ~/.claude.json > ~/.claude.json.tmp && mv ~/.claude.json.tmp ~/.claude.json
