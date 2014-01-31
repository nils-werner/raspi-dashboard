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

    echo KEYMAP=\"de-latin1-nodeadkeys\ > /etc/vconsole.conf
    echo LANG=\"de_DE.UTF-8\" > /etc/locale.conf
    echo LANGUAGE=\"de_DE.UTF-8\" >> /etc/locale.conf
    locale-gen
    ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime -f

Properly initialized pacman

    pacman-key --init
    pacman -Syu --noconfirm

Installed Git

    pacman -S --noconfirm git

Installation
------------

Clone the sources

    git clone https://github.com/nils-werner/kioskOS.git

Run the installer

    cd kioskOS
    bash install.sh
