kioskOS
=======

kioskOS is a script to modify a Arch Linux installation running on a Raspberry Pi. The result is a Linux that

 - automatically boots into a minimalistic, frameless browser when started
 - works entirely read-only

The result is a display driver that can be switched on and off at any time of the day and that will still reliably show the same image after being switched on again. This means once the system is set up no instructions or special knowledge are necessary to start and stop the display: Simply cutting the power will power the device down.

Please note that this project does not include any webserver or storage to save data to be shown. The data to be shown must be accessible over the network, provided by a different device.

Preparations
------------

This script assumes you have done the following:

Installed the latest image of [archlinux ARM](http://archlinuxarm.org/platforms/armv6/raspberry-pi) and booted the system.

Edited locale and keyboard layout as well as timezone

    echo KEYMAP=\"de-latin1-nodeadkeys\" > /etc/vconsole.conf
    echo LANG=\"de_DE.UTF-8\" > /etc/locale.conf
    echo LANGUAGE=\"de_DE.UTF-8\" >> /etc/locale.conf
    locale-gen
    ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime -f

Properly initialized pacman and upgraded system

    pacman-key --init
    pacman -Syu

Installed Git

    pacman -S git

And lastly grown the partition to be at least 4 GB in size (use `resize.sh` provided here if unsure what to do)

Customization
-------------

Clone the sources

    git clone https://github.com/nils-werner/kioskOS.git

There are two places you might want to customize:

    data/etc/netctl/wlan0

is a generic template for a wireless LAN connection, protected by WPA. Input your WLAN SSID and password if you want to use wireless LAN

secondly 

    data/home/display/.config/midori/config

contains a field named `homepage`. This field will be loaded by the browser upon booting. Insert your URL here.

Installation
------------

After customizing your kiosk, run the installer

    cd kioskOS
    bash install.sh

Feedback, Contributions
-----------------------

This is a very rough first attempt to create a simple and robust kiosk display driver. Feedback and improvements are very welcome!