#!/bin/bash
#This script moves all directories with name 'other' and place them(with everything inside) into new directory. 
#In this case its '../NEW/'
#It keeps the original catalog sctructre.
#It also removes all copied files and all empty directories

find AnimeHQdataset/ -name 'IP55D' -exec rsync -av --progress --remove-source-files --relative {} Anime_dataset/ \;
find . -type d -empty -delete
