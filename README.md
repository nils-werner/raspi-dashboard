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

Changed the all passwords

    passwd

Edited locale and keyboard layout as well as timezone

    echo KEYMAP=\"de-latin1-nodeadkeys\" > /etc/vconsole.conf
    echo LANG=\"de_DE.UTF-8\" > /etc/locale.conf
    echo LANGUAGE=\"de_DE.UTF-8\" >> /etc/locale.conf

Uncommented the locales in `/etc/locale.gen`, then ran

    locale-gen
    ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime -f

Properly initialized pacman and upgraded the system

    pacman-key --init
    pacman -Syu

Installation
------------

Clone the sources

    git clone https://github.com/nils-werner/raspi-dashboard.git

After customizing your dashboard, create the package and install it

    makepkg -si

Customization
-------------

    /home/display/.xinitrc

contains a line `dwb -R http://www.google.com/`. The URL in this line will be loaded by the browser upon booting. Insert your URL here.
