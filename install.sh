#/bin/env bash

# Make boot partition writeable, we want to modify files there
mount -o remount,rw /boot

# Copy files in place
cp data/* /

echo display_rotate=3 >> /boot/config.txt
echo disable_overscan=1 >> /boot/config.txt

echo -n " ro" >> /boot/commandline.txt

# Create display user
pacman -S --noconfirm lvm2 sudo
useradd -g users -s /bin/bash -d /home/display display
chown -R display:users /opt/home/display/

# Enable auto login service
systemctl daemon-reload
systemctl disable getty@tty1
systemctl enable autologin@tty1.service

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
