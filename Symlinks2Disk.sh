#!/bin/bash
# Check if root
if [ "$EUID" -ne 0 ]
        then echo "Please run as root"
        exit
fi


ln -s /dev/disk/by-id/$1 /disks/$2
ln -s /dev/disk/by-id/$1-part1 /disks/$21
ln -s /dev/disk/by-id/$1-part9 /disks/$29

