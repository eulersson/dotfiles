#!/bin/sh
# Cycle Alacritty font size: 18 -> 20 -> 14 -> 16 -> 18 ...

state_file="$HOME/.local/state/alacritty_font_size"
mkdir -p "$(dirname "$state_file")"

current=$(cat "$state_file" 2>/dev/null || echo "18")

case "$current" in
  18) next=20 ;;
  20) next=14 ;;
  14) next=16 ;;
  *)  next=18 ;;
esac

echo "$next" > "$state_file"
/usr/local/bin/alacritty msg config "font.size=$next"
