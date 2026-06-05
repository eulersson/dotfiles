#!/bin/sh
# Set kitty `background_blur` to the value passed as $1 (0/32/64), preserving
# the current runtime `background_opacity`. Blur is a static-only option in
# kitty (no runtime action exists), so we have to rewrite kitty.conf and
# `load-config`, which would otherwise snap opacity back to the on-disk value.

blur="${1:-0}"
case "$blur" in
  0|32|64) ;;
  *) echo "usage: $0 <0|32|64>" >&2; exit 1 ;;
esac

# Kitty appends its PID to the `listen_on` socket path (e.g. /tmp/mykitty-1234).
# Use KITTY_LISTEN_ON when it points at a live socket; otherwise glob for the
# most recent one (handles stale env vars from old kitty PIDs).
socket="${KITTY_LISTEN_ON:-}"
sock_path="${socket#unix:}"
if [ -z "$sock_path" ] || [ ! -S "$sock_path" ]; then
  match=$(ls -t /tmp/mykitty-* 2>/dev/null | head -n 1)
  [ -n "$match" ] && socket="unix:$match"
fi

# Capture the live opacity so we can restore it after load-config resets it
# to the value baked into kitty.conf.
opacity=$(kitten @ --to "$socket" ls 2>/dev/null \
  | python3 -c 'import sys,json; print(json.load(sys.stdin)[0]["background_opacity"])' 2>/dev/null)

sed -i '' "s/^background_blur .*/background_blur            $blur/" \
  "$HOME/.config/kitty/kitty.conf"

kitten @ --to "$socket" load-config

if [ -n "$opacity" ]; then
  kitten @ --to "$socket" set-background-opacity "$opacity"
fi
