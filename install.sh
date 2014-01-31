#/bin/env bash

# Make boot partition writeable, we want to modify files there
mount -o remount,rw /boot

# Copy files in place
cp data/* /

# Create display user
pacman -S --noconfirm libarchive lvm2 adduser sudo
adduser --disabled-password --gecos "" display

# Enable auto login service
systemctl daemon-reload
systemctl disable getty@tty1
systemctl enable autologin\@.service
systemctl start autoload@tty1

# Install tools and X
pacman -S --noconfirm netctl openbox midori ttf-freefont git
pacman -S --noconfirm xorg-server xorg-xinit xorg-utils xorg-server-utils xf86-video-fbdev unclutter xdotool

# Install display crontab
sudo -u display crontab /opt/home/display/crontab

# Move log directry to tmpfs partition
rm -rf /var/log
ln -s /run/log /var/log

# Reboot
reboot
