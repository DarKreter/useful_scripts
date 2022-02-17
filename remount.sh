#!/bin/bash
disk="sd$11"
echo $disk
systemctl stop smbd
umount -R /mnt/disk
mount "/dev/$disk" /mnt/disk
systemctl start smbd
chmod -R o+rwx /mnt/disk

