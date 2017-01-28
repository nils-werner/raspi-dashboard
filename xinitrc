# Disable screensaver
xset s off
xset -dpms

# Start window manager
ratpoison &

# Start browser
qutebrowser :fullscreen http://www.google.com/

# Do not immediately restart after browser was quit/killed/crashed
sleep 5
