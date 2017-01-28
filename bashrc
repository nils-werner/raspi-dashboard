# Disable screensaver
xset s off
xset -dpms

# Start window manager
ratpoison &

# Press 'xx' in 30 seconds to hide tab- and statusbar
xdotool sleep 30 key x key x &

# Start browser
dwb -R http://www.google.com/

# Do not immediately restart after browser was quit/killed/crashed
sleep 5
