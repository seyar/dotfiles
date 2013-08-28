#!/bin/sh
#Видео сжиматор. 
#depends HandBrakeCli

for f in *.MOV
do
    HandBrakeCLI -i $f -o ${f:0:-3}mp4 -e x264 -q 20 -B 160
done
rm *.MOV
