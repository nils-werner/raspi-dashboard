#/bin/env bash

echo "Installing sudo"
pacman -S --noconfirm sudo > /dev/null

echo "Copying files in place"
cp -r data/* /

echo "Customizing Config and Kernel Commandline"
echo display_rotate=3 >> /boot/config.txt
echo disable_overscan=1 >> /boot/config.txt

echo "Free enough memory for the browser to work"
echo gpu_mem=64 >> /boot/config.txt
echo gpu_mem_512=64 >> /boot/config.txt
echo gpu_mem_256=64 >> /boot/config.txt
echo arm_freq=1000 >> /boot/config.txt
echo core_freq=500 >> /boot/config.txt
echo sdram_freq=500 >> /boot/config.txt
echo over_voltage=6 >> /boot/config.txt


echo -n " ro" >> /boot/cmdline.txt

echo "Createing display user"
if ! id -u display >/dev/null 2>&1; then
    useradd -g users -s /bin/bash -d /home/display display
fi
chown -R display:users /opt/home/display/

echo "Setting up auto login service"
systemctl daemon-reload > /dev/null
systemctl enable rc-local > /dev/null
systemctl disable getty@tty1 > /dev/null
systemctl enable autologin@tty1 > /dev/null

echo "Setting up network"
pacman -S --noconfirm netctl > /dev/null
# For some stupid reason name resolving does not work if we do not do this
systemctl enable dhcpcd > /dev/null
netctl enable wlan0 > /dev/null

echo "Installing software"
pacman -S --noconfirm openbox midori ttf-freefont > /dev/null
pacman -S --noconfirm xorg-server xorg-xinit xorg-utils xorg-server-utils xf86-video-fbdev unclutter xdotool > /dev/null

echo "Installing crontab"
sudo -u display crontab /opt/home/display/crontab > /dev/null

echo "Moveing log directry to tmpfs partition"
rm -rf /var/log
ln -s /run/log /var/log

echo "All finished"
read -p "Press [Enter] key to reboot..."
reboot
