USER=$(whoami)
cat <<EOF >~/Library/LaunchAgents/com.ramn.dev.alacritty-dark-light.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.ramn.dev.alacritty-dark-light</string>

    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/bin/dark-notify</string>
        <string>-c</string>
        <string>/Users/$USER/.config/alacritty/dark-light-pref-change.sh</string>
    </array>

    <key>RunAtLoad</key>
    <true/>

    <key>KeepAlive</key>
    <true/>

    <key>StandardOutPath</key>
    <string>/tmp/dark-notify.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/dark-notify.err</string>
</dict>
</plist>
EOF
DOMAIN="gui/$(id -u)"
SERVICE="$DOMAIN/com.ramn.dev.alacritty-dark-light"
PLIST="$HOME/Library/LaunchAgents/com.ramn.dev.alacritty-dark-light.plist"

# Remove existing service if loaded
launchctl bootout "$SERVICE" 2>/dev/null
launchctl bootstrap "$DOMAIN" "$PLIST"
