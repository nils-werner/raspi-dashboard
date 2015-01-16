raspi-dashboard
===============

raspi-dashboard is a script to modify a Arch Linux installation running on a Raspberry Pi that

 - automatically boots into a minimalistic, frameless browser when started
 - works entirely read-only

The result is a display driver that can be switched on and off at any time of the day and that will still reliably show the same image after being switched on again. This means once the system is set up no instructions or special knowledge are necessary to start and stop the display: Simply cutting the power will power the device down.

Please note that this project does not include any webserver or storage to save data to be shown. The data to be shown must be accessible over the network, provided by a different device or service, for example:

 - [Status Board at Panic](http://www.panic.com/blog/the-panic-status-board/)
 - [Geckoboard](http://www.geckoboard.com/)
 - [Shopify's dashing](http://shopify.github.io/dashing/)

Preparations
------------

This script assumes that you have a good knowledge of how Arch Linux does things and that you have done the following:

Installed the latest image of [archlinux ARM](http://archlinuxarm.org/platforms/armv6/raspberry-pi) and booted the system.

Changed the `root` user password

    passwd

Edited locale and keyboard layout as well as timezone

    echo KEYMAP=\"de-latin1-nodeadkeys\" > /etc/vconsole.conf
    echo LANG=\"de_DE.UTF-8\" > /etc/locale.conf
    echo LANGUAGE=\"de_DE.UTF-8\" >> /etc/locale.conf

Uncommented the locales in `/etc/locale.gen`, then ran

    locale-gen
    ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime -f

Edited the pacman mirrorlist in `/etc/pacman.d/mirrorlist`.

Properly initialized pacman and upgraded system

    pacman-key --init
    pacman -Syu

Installed Git

    pacman -S git

And lastly grown the partition to be at least 4 GB in size (use `resize.sh` provided here if unsure what to do)

Installation
------------

Clone the sources

    git clone https://github.com/nils-werner/raspi-dashboard.git

After customizing your dashboard, run the installer

    cd raspi-dashboard
    bash install.sh

Customization
-------------

There are three places you might want to customize:

    data/etc/netctl/wlan0

is a generic template for a wireless LAN connection, protected by WPA. Input your WLAN SSID and password if you want to use wireless LAN. The `wlan0` profile will be installed but only actually be activated if you actually change these values.

secondly 

    data/opt/home/display/.xinitrc

contains a line `dwb -R http://www.google.com/`. The URL in this line will be loaded by the browser upon booting. Insert your URL here.

Lastly, the Raspberry Pi is configured to boot with an image rotated 90 degrees to the left. Remove the line

    +display_rotate=3

in

    patch/boot-etc.patch

if you want to boot with a normal image instead.


Feedback, Contributions
-----------------------

This is a very rough first attempt to create a simple and robust dashboard display driver. Feedback and improvements are very welcome!
