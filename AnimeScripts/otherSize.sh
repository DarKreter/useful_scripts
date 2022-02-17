#!/bin/bash
#This script reads size of the other directories

find '/nfs/AnimeAll/_~~MofyVortel~~_  [IP55D]' -type d -name other -exec du -ch {} + | grep total$
