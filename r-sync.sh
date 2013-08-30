#!/bin/bash
#@depends on exiftool
#Входная папка
BASEDIR="."
#Бекапный винт
BACKUPDIR="/Volumes/Time Machine/"
#в какой папке мы запустили скрипт туда и положим файлы
SCRIPT_DIR=$PWD
echo `basename "${PWD}"`
exit


if [ -d "${BACKUPDIR}photos/" ]; then 
  #забекапим на внешний винт. Все вместе с симлинкой
  rsync -r -L $BASEDIR "${BACKUPDIR}photos/"
  echo "Синхронизировано с ${BACKUPDIR}"
else
  echo "Не синхронизировано."
fi;

