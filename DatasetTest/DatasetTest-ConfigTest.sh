#!/bin/bash
# Check if root
if [ "$EUID" -ne 0 ]
        then echo "Please run as root"
        exit
fi

dataset=$1

#check dataset parameters
dedupValue=$(zfs get dedup $dataset | grep dedup | awk {'print $3'})
compressionValue=$(zfs get compression $dataset | grep compression | awk {'print $3'})
encryptionValue=$(zfs get encryption $dataset | grep encryption | awk {'print $3'})
recordSizeValue=$(zfs get recordsize $dataset | grep recordsize | awk {'print $3'})


echo "Compression:	$compressionValue"
echo "Encryption:	$encryptionValue"
echo "Dedup:		$dedupValue"
echo "RecordSize:	$recordSizeValue"
echo ""

./DatasetTest-CopyFolder.sh /mnt/test/big $dataset
rm -rf /ANIME/big

./DatasetTest-CopyFolder.sh /mnt/test/small $dataset
rm -rf /ANIME/small

./DatasetTest-CopyFolder.sh /mnt/test/many1 $dataset
rm -rf /ANIME/many1

./DatasetTest-CopyFolder.sh /mnt/test/many2 $dataset
rm -rf /ANIME/many2

echo ""
echo ""
