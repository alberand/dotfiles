#!/bin/bash

# Automatic monitor switching on plug/unplug
nohup mons -a -x "/home/alberand/.dotfiles/monitor-update.sh" > /dev/null 2>&1 &

# Disable touchpad while typing. Disables keyboard for 0.15s after keypress
syndaemon -i 0.15 -t -K -R -d

# Set layout to us and ru and 'Caps Lock' toggle
setxkbmap -layout us,ru -option grp:win_space_toggle

# Map Caps Lock to Ctrl
setxkbmap -option ctrl:nocaps

# Set repeat key time
xset r rate 400 30 &

# Run automount tool
devmon --exec-on-drive "i3-msg \"workspace 9; exec notify-send 'USB drive connected' 'The device is at %d'; exec /usr/bin/kitty -d='%d' \"" &

# Run compositor
picom -b --config ~/.config/picom.conf &

# Set desktop wallpapaer or color
feh --bg-scale $HOME/Images/wallpaper.png
# hsetroot -solid "#182438"

systemctl --user import-environment DISPLAY
xrandr --auto
exec i3
