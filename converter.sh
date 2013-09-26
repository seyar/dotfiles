#!/bin/sh
#Видео сжиматор.
#depends HandBrakeCli

for f in *.MOV
do
    HandBrakeCLI -i $f -o ${f:0:-2}_converted.mp4 -e x264 -q 20 -B 160 --keep-display-aspect
done
rm *.MOV
