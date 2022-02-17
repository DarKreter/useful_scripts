#!/bin/bash
# Check if root
if [ "$EUID" -ne 0 ]
        then echo "Please run as root"
        exit
fi

folderToCopy=$1
folderName=$(basename $folderToCopy)

dataset=$2

output=$(rsync -avr --progress $folderToCopy /ANIME/ | grep bytes/sec)
totalSizeSmall=$(echo $output | awk {'print $2'} | tr -d ,)
totalSpeedSmall=$(echo $output | awk {'print $7'} | tr -d , | awk -F . {'print $1'})
SmallResultTime=$((totalSizeSmall/totalSpeedSmall))
SmallResultSpeed=$((totalSpeedSmall/1048576))

SmallRatio=$(zfs get ratio $dataset | grep ratio | awk {'print $3'})

#rm -rf /MAIN/$(basename $folderTopCopy)

echo "  $folderName:"
echo "          Speed   $SmallResultSpeed MB/s"
echo "          Time    $SmallResultTime s"
echo "          Ratio   $SmallRatio"
