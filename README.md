raspi-dashboard
===============

raspi-dashboard is a script to modify a Arch Linux installation running on a Raspberry Pi that automatically boots into a minimalistic, frameless browser when started

Please note that this project does not include any webserver or storage to save data to be shown. The data to be shown must be accessible over the network, provided by a different device or service, for example:

 - [Status Board at Panic](http://www.panic.com/blog/the-panic-status-board/)
 - [Geckoboard](http://www.geckoboard.com/)
 - [Shopify's dashing](http://shopify.github.io/dashing/)

Preparations
------------

This script assumes that you have a good knowledge of how Arch Linux does things and that you have done the following:

Installed the latest image of [archlinux ARM](http://archlinuxarm.org/) and booted the system.

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

Create the package and install it using

    makepkg -si

Customization
-------------

    /home/display/.xinitrc

contains a line `dwb -R http://www.google.com/`. The URL in this line will be loaded by the browser upon booting. Insert your URL here.

Readonly filesystem
-------------------

To protect your SD card against wear and tear, see [`arch-overlayroot`](https://github.com/nils-werner/arch-overlayroot) for a simple overlay based readonly file system solution.
