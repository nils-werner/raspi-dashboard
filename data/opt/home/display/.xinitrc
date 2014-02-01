xset s off
xset -dpms
openbox-session &
unclutter -idle 1 -jitter 2 -root &
#midori -e Navigationbar -e Fullscreen
xdotool sleep 30 key Tab &
midori
sleep 5
