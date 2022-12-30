#!/bin/bash
#This script moves everything inside IP55D directory to new one. 
#In this case its 'Anime_dataset/'
#It keeps the original catalog sctructre.
#It also removes all copied files and all empty directories

find AnimeHQdataset/ -name 'IP55D' -exec rsync -av --progress --remove-source-files --relative {} Anime_dataset/ \;
find . -type d -empty -delete
