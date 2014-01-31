#/bin/env bash

# Install sudo
pacman -S --noconfirm sudo

# Copy files in place
cp -r data/* /

echo display_rotate=3 >> /boot/config.txt
echo disable_overscan=1 >> /boot/config.txt

echo -n " ro" >> /boot/commandline.txt

# Create display user
if ! id -u display >/dev/null 2>&1; then
    useradd -g users -s /bin/bash -d /home/display display
fi
chown -R display:users /opt/home/display/

# Enable auto login service
systemctl daemon-reload
systemctl enable rc-local
systemctl disable getty@tty1
systemctl enable autologin@tty1

# For some stupid reason name resolving does not work if we do not do this
systemctl enable dhcpcd

# Install tools and X
pacman -S --noconfirm netctl openbox midori ttf-freefont
pacman -S --noconfirm xorg-server xorg-xinit xorg-utils xorg-server-utils xf86-video-fbdev unclutter xdotool

# Install display crontab
sudo -u display crontab /opt/home/display/crontab

# Move log directry to tmpfs partition
rm -rf /var/log
ln -s /run/log /var/log

# Reboot
reboot
