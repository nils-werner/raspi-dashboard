kioskOS
=======

Preparations
------------

This script assumes you have done the following

Updated your mirrorlist

    vi /etc/pacman.d/mirrorlist

Updated sources and install a proper editor

    pacman -Sy --noconfirm vim

Edited locale manually

    vim /etc/locale.conf
    echo KEYMAP=de-latin1-nodeadkeys > /etc/vconsole.conf
    ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime -f

Properly initialized pacman

    pacman-key --init --noconfirm
    pacman -Syu --noconfirm

Installed Git

    pacman -S --noconfirm git

Installation
------------

Clone the sources

    https://github.com/nils-werner/kioskOS.git

Run the installer

    cd kioskOS
    bash install.sh
