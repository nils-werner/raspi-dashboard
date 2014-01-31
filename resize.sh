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



w" | fdisk -cu /dev/mmcblk0

reboot

else
    if [ "$1" == "continue" ]
    then
        echo "Continuing with step two..."
        # Check partition
        e2fsck -f /dev/mmcblk0p5

        # Resize partition
        resize2fs /dev/mmcblk0p5

        reboot
    fi
fi
