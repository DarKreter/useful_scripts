#!/bin/bash
# Check if root
if [ "$EUID" -ne 0 ]
        then echo "Please run as root"
        exit
fi


ln -s $1 /disks/$2
ln -s $1-part1 /disks/$2p1
ln -s $1-part9 /disks/$2p9

