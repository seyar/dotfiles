#!/bin/bash
#@depends on exiftool
#Входная папка
BASEDIR="."
#Бекапный винт
BACKUPDIR="/Volumes/Time Machine/"

if [ -d "${BACKUPDIR}photos/" ]; then 
  #забекапим на внешний винт. Все вместе с симлинкой
  rsync -r -L $BASEDIR "${BACKUPDIR}photos/"
  echo "Синхронизировано с ${BACKUPDIR}"
else
  echo "Не синхронизировано."
fi;

