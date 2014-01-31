kioskOS
=======

Preparations
------------

This script assumes you have done the following:

Installed the latest image of [archlinux ARM](http://archlinuxarm.org/platforms/armv6/raspberry-pi) and booted the system.

Customized your mirrorlist

    vi /etc/pacman.d/mirrorlist

Updated sources and installed a proper editor

    pacman -Sy vim

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

Installation
------------

Clone the sources

    git clone https://github.com/nils-werner/kioskOS.git

Run the installer

    cd kioskOS
    bash install.sh
