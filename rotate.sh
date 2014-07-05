#!/bin/bash
##
#A simple shell script which rotates all photos in the specified folder to their correct orientation. It reads the orientation tag from the EXIF specification.
#It uses the utilities jpegtran and jpegexiforient which are a part of the "libjpeg-progs" package.
#http://jpegclub.org/exif_orientation.html
##


echo Enter the path to the folder containing the photos:

read folder
folder=${folder}*

sudo chmod -R 755 $folder

for i in $folder
 do

  varexif=$(jpegexiforient -n $i)
  
  case 'jpegexiforient -n "$i"' in
  3) angle="-rotate 180";;	
  6) angle="-rotate 90";;
  8) angle="-rotate 270";;
  *) angle="";;
  esac
  
  echo rotating $i by $angle degrees
  
  jpegtran $angle -outfile $i -copy all $i
  
  jpegexiforient -1 $i
  
  done

