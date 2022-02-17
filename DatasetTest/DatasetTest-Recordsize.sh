#!/bin/bash
# Check if root
if [ "$EUID" -ne 0 ]
        then echo "Please run as root"
        exit
fi

dataset=$1

for i in 512B 512B 8KB 64KB 128KB 1M
do
	zfs set recordsize=$i $dataset
	./DatasetTest-ConfigTest.sh $dataset       
done


