#!/bin/bash

## http://www.sno.phy.queensu.ca/~phil/exiftool/exiftool_pod.html
## installation: sudo apt-get install libimage-exiftool-perl

music=/home/bhavijagwani/Documents/music2/*
count=0
for i in $music
do 
	name=$(exiftool -m -p '$title' $i)
	if [[ -n "$name" ]]
	then 
		name=$(echo $name | tr -dc "[:alnum:]")
		name="/home/bhavijagwani/Documents/music2/$name.mp3"
		mv $i $name
		count=$((count +1))
	else 
		album=$(exiftool -m -p '$album' $i)
		album=$(echo $album | tr -dc "[:alnum:]")
		if [[ -n "$album" ]]
		then 
			album="/home/bhavijagwani/Documents/music2/$album.mp3"
			mv $i $album
			count=$((count +1))
		else echo "file not renamed"
		fi
	fi

done
echo $count " files renamed"