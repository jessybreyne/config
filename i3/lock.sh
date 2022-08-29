#!/usr/bin/bash

killall xidlehook

# Run xidlehook
xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  `#--not-when-audio` \
  `# Dim the screen after 60 seconds, undim if user becomes active` \
  --timer 30 \
    '~/.config/i3/scripts/blur-lock' \
  `# turn off screen` \
  --timer 300 \
    'systemctl suspend' \
  &

