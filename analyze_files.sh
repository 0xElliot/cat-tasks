#!/bin/bash 

directory=$1

if [ -d $directory ]
then

	# analyze image using exiftool
	echo "----- analyze photoe -----"
	for file in $(find "$directory" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.tiff" \))
	do
		echo "file : "$file
		exiftool "$file"
		echo "----------------------"
	done

	# analyze video and audios
	echo "----- analyze video and videos -----"
	for file in $(find "$directory" -type f \( -iname "*.mp3" -o -iname "*.wav" -o -iname "*.ogg" -o -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" -o -iname "*.mov" \))
	do
		echo "file : " $file
		mediainfo "$file"
		echo "-------------------------"

	done
	echo "----------------------------"

	echo "analyze other files"
	for file in $(find "$directory" -type f)
	do
    echo "File: $file"
    if file "$file" | grep -q "ASCII text" 
    then
        strings "$file"

    elif file "$file" | grep -q "pcap"; then
        tcpdump -nn -r "$file"
    else
        echo "unknown file"
    fi
    echo "-------------------------"
	done

fi
