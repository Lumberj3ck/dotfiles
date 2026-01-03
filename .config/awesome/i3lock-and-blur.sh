#!/usr/bin/env bash

lighticon="$HOME/images/lock-icon-light.png"
darkicon="$HOME/images/lock-icon-dark.png"
tmpbg='/tmp/screen.png'

# take a screenshot
scrot "$tmpbg"

# blur the screenshot by resizing and scaling back up
convert "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"

i3lock -i "$tmpbg"
rm "$tmpbg"
