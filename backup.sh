#!/bin/bash

# set source and destination directories
# source_directory="file"
# backup_destination="backup"

read -p "enter tha directory you wanna bachup : " source_directory
read -p "enter the path you wanna seve the bachup : " backup_destination

#set the data for he backup
date_formate=$(date +"%d-%m-%y_%H-%M-%S")
backup_archieve="$backup_destination/backup_$date_formate.tar.gz"

#create the backup

tar -czvf "$backup_archieve" "$source_directory"

#check

if [ $? -eq 0 ]
then 
	echo "Backup complete seccessfully"
else
	echo "failed backup"
fi
