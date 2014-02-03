#/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Mounting partitions as read-write"
mount -o remount,rw /
mount -o remount,rw /boot

echo "Installing build dependencies"
read -p "Press [Enter] key to continue..."
pacman -S --noconfirm sudo patch diffutils

echo "Deleting display user"
read -p "Press [Enter] key to continue..."
userdel display

echo "Removing auto login service"
read -p "Press [Enter] key to continue..."
systemctl daemon-reload
systemctl disable rc-local
systemctl disable autologin@tty1
systemctl enable getty@tty1

echo "Disabling WLAN network"
read -p "Press [Enter] key to continue..."
# For some stupid reason name resolving does not work if we do not do this
netctl disable wlan0

echo "Removing installed files"
read -p "Press [Enter] key to continue..."
cd data
find . -type f -exec rm -rf /{} \;
rm -rf /opt/home
cd $DIR

echo "Unpatching system files"
read -p "Press [Enter] key to continue..."
cd /
patch -p1 -R -i $DIR/patch/boot-etc.patch
cd $DIR

echo "Removing software"
read -p "Press [Enter] key to continue..."
pacman -R --noconfirm openbox midori ttf-freefont xorg-server xorg-xinit xorg-utils xorg-server-utils xf86-video-fbdev unclutter xdotool fbset

echo "Creatng dedicated log directory"
read -p "Press [Enter] key to continue..."
rm -rf /var/log
mkdir /var/log

echo "All finished, rebooting"
read -p "Press [Enter] key to continue..."
reboot
