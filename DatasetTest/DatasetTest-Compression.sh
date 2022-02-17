#!/bin/bash
# Check if root
if [ "$EUID" -ne 0 ]
        then echo "Please run as root"
        exit
fi

dataset=$1

for compr in off zstd-1 zstd-5 zstd-10 zstd-19
	#on off lzjb gzip zle lz4 zstd zstd-fast-1 zstd-fast-1000
do
        zfs set compression=$compr $dataset
	./DatasetTest-ConfigTest.sh $dataset       
done


