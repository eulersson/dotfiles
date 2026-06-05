#!/bin/sh
# Set kitty `background_opacity` to $1 and rewrite the `@opacity` suffix on
# every color in `transparent_background_colors` to match. Kitty snapshots
# the inherited opacity at config-load time, so without rewriting + reloading
# the per-color cells stay frozen at the static config value.

opacity="${1:-0.75}"

socket="${KITTY_LISTEN_ON:-}"
sock_path="${socket#unix:}"
if [ -z "$sock_path" ] || [ ! -S "$sock_path" ]; then
  match=$(ls -t /tmp/mykitty-* 2>/dev/null | head -n 1)
  [ -n "$match" ] && socket="unix:$match"
fi

python3 - "$HOME/.config/kitty/kitty.conf" "$opacity" << 'EOF'
import re, sys
path, opa = sys.argv[1], sys.argv[2]
with open(path) as f:
    lines = f.readlines()
token_re = re.compile(r'(#[0-9a-fA-F]{6})(?:@[0-9.]+)?')
for i, line in enumerate(lines):
    if line.startswith('transparent_background_colors'):
        lines[i] = token_re.sub(lambda m: f'{m.group(1)}@{opa}', line)
        break
with open(path, 'w') as f:
    f.writelines(lines)
EOF

kitten @ --to "$socket" load-config
kitten @ --to "$socket" set-background-opacity "$opacity"
