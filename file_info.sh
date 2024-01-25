#!/bin/bash

read -p "enter the file path : " file_path

if [ -e $file_path ]
then
	if [ -f $file_path ]
	then
		permessions=$(ls -lah $file_path | cut -d " " -f 1)
		owner=$(ls -lah $file_path | cut -d " " -f 4)
		siez=$(ls -lah $file_path | cut -d " " -f 5) 
		echo "---- file informations ----"
		echo "permession : $permessions"
		echo "owner : $owner"
		echo "size : $siez"
	else
		echo " $file_path it's a directory (JUST ACCEPTED FILES)"
	fi

else
		echo "file not existing , or invalid input (JUST ACCEPTED FILES)"
fi