#/bin/env bash

if [ $# -eq 0 ]
then
    echo "Growing the root partition is a two-step process with a reboot in between"
    echo "After rebooting, please run '$0 contine' to contine the process"
    read -p "Press [Enter] key to start first step..."

# Delete partition
echo "d
5


d
2


n
e



n
l



w" | fdisk -cu /dev/mmcblk0 > /dev/null

    echo "Partition table has been changed."
    read -p "Press [Enter] key to reboot..."

reboot

else
    if [ "$1" == "continue" ]
    then
        echo "Continuing with step two..."
        # Resize partition
        resize2fs /dev/mmcblk0p5 > /dev/null

        echo "Partition has been resized."
        read -p "Press [Enter] key to reboot..."

        reboot
    fi
fi
