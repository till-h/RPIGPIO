#!/usr/bin/env bash
df -h
read -p "Do you want to continue? Will overwrite anything on /dev/mmcblk0. (Enter to continue, Strg+C to abort)" yn
umount /dev/mmcblk0*
echo "Clearing SD card..."
dd bs=4M if=/dev/null of=/dev/mmcblk0 status=progress
echo "Sync..."
sync
echo "Writing image to SD card..."
dd bs=4M if=/home/till/RaspbianJesseGPIO.img of=/dev/mmcblk0 status=progress
echo "Sync..."
sync
echo "Done."