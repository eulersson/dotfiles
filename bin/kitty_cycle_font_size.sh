#!/bin/sh
# Cycle kitty font size: 18 -> 20 -> 14 -> 16 -> 18 ...

state_file="$HOME/.local/state/kitty_font_size"
mkdir -p "$(dirname "$state_file")"

current=$(cat "$state_file" 2>/dev/null || echo "18")

case "$current" in
  18) next=20 ;;
  20) next=14 ;;
  14) next=16 ;;
  *)  next=18 ;;
esac

echo "$next" > "$state_file"

# Kitty appends its PID to the `listen_on` socket path (e.g. /tmp/mykitty-1234),
# so when KITTY_LISTEN_ON isn't inherited (background launches, foreign shells)
# we glob for the most recent matching socket.
socket="${KITTY_LISTEN_ON:-}"
if [ -z "$socket" ]; then
  match=$(ls -t /tmp/mykitty-* 2>/dev/null | head -n 1)
  [ -n "$match" ] && socket="unix:$match"
fi

kitten @ --to "$socket" set-font-size "$next"
