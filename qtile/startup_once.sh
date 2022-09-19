#!/usr/bin/env bash 
# festival --tts $HOME/.config/qtile/welcome_msg &
lxsession &

xrandr --output VGA-0 --off --output LVDS-0 --mode 1920x1080 --pos 0x360 --rotate normal --output DP-0 --off --output HDMI-0 --primary --mode 2560x1440 --pos 1920x0 --rotate normal --output DP-1 --off --output DP-2 --off &
# picom --config ~/.config/qtile/picom/picom.conf --experimental-backends &
# /usr/bin/emacs --daemon &
# conky -c $HOME/.config/conky/qtile/doom-one-01.conkyrc
# volumeicon &
nm-applet &
redshift &
xbacklight -set 50 &
# sh ~/.screenLayout/screenLayout.sh
# sh ~/.config/qtile/lock

### UNCOMMENT ONLY ONE OF THE FOLLOWING THREE OPTIONS! ###
# 1. Uncomment to restore last saved wallpaper
# xargs xwallpaper --stretch < ~/.cache/wall &
# 2. Uncomment to set a random wallpaper on login
# find /usr/share/backgrounds/dtos-backgrounds/ -type f | shuf -n 1 | xargs xwallpaper --stretch &
# 3. Uncomment to set wallpaper with nitrogen
nitrogen --restore &



killall xidlehook

# Run xidlehook
xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  --timer 870 \
    'notify-send -t 30000 "Vérouillage dans 30s"' \
    '' \
    --timer 30 \
    'i3lock -c 000000' \
    '' \
  --timer 300 \
    'systemctl suspend' \
    '' \
  &

