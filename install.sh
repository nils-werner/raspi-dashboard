#/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing build dependencies"
read -p "Press [Enter] key to continue..."
pacman -S --noconfirm --needed sudo patch diffutils

echo "Copying files in place"
read -p "Press [Enter] key to continue..."
cp -r data/* /

echo "Patching system files"
read -p "Press [Enter] key to continue..."
cd /
patch -p1 -i $DIR/patch/boot-etc.patch
cd $DIR

echo "Creating display user"
read -p "Press [Enter] key to continue..."
useradd -g users -s /bin/bash -d /home/display display
chown -R display:users /opt/home/display/

echo "Setting up auto login service"
read -p "Press [Enter] key to continue..."
systemctl daemon-reload
systemctl enable rc-local
systemctl disable getty@tty1
systemctl enable autologin@tty1

echo "Setting up network"
read -p "Press [Enter] key to continue..."
pacman -S --needed --noconfirm netctl
# For some stupid reason name resolving does not work if we do not do this
systemctl enable dhcpcd

# Check if WiFi has actually been changed and contains reasonable data
if [ ! $(md5sum data/etc/netctl/wlan0 | awk '{print $1}') = "cb0c43d7468a7880bb3f1be4a707cf4d" ]
then
    echo "Installing WiFi"
    netctl enable wlan0
fi

echo "Installing software"
read -p "Press [Enter] key to continue..."
pacman -S --needed --noconfirm ratpoison dwb ttf-freefont xorg-server xorg-xinit xorg-utils xorg-server-utils xf86-video-fbdev unclutter xdotool fbset

echo "Installing crontab"
read -p "Press [Enter] key to continue..."
sudo -u display crontab /opt/home/display/crontab

echo "Moving log directry to tmpfs partition"
read -p "Press [Enter] key to continue..."
rm -rf /var/log
ln -s /run/log /var/log

echo "All finished, rebooting"
read -p "Press [Enter] key to continue..."
reboot
