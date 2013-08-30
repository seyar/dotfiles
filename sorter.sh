#!/bin/bash 
#@depends on exiv2
#Входная папка
BASEDIR="."
#Бекапный винт
BACKUPDIR="/Volumes/Time Machine/"
#список не вложенных jpg файлов
#LIST=`find . -iname "*.jpg" -print0 -d 1`
#LIST=`ls | grep -i  ".jpg"`
#строка для грепа даты из экзива 
STRTIME="Image timestamp" 
#строка для грепа камеры из экзив инфы
CAMERAMODEL="Camera model"

#название папок месяцами
MONTHS[1]='1-January'
MONTHS[2]='2-February'
MONTHS[3]='3-March'
MONTHS[4]='4-April'
MONTHS[5]='5-May'
MONTHS[6]='6-June'
MONTHS[7]='7-July'
MONTHS[8]='8-August'
MONTHS[9]='9-September'
MONTHS[10]='10-Octovber'
MONTHS[11]='11-November'
MONTHS[12]='12-December'

find . -iname "*.jpg" -d 2 -print0 | while read -d $'\0' F 
do
  #Год
  YEAR=`exiv2 "$F" | grep -a "${STRTIME}" | awk '{ print $4 }' | awk -F: '{ print $1 }'` 
  #Месяц ведущего без нуля
  MONTH=`exiv2 "$F" | grep -a "${STRTIME}" | awk '{ print $4 }' | awk -F: '{ print $2 }' | sed -e s/0//` 
  #день
  #DAY=`exiv2 "$F" | grep "${STRTIME}" | awk '{ print $4 }' | awk -F: '{ print $3 }'` 
  #модель камеры без инфы грепа и замена пробелов на слеш
  MODEL=`exiv2 "$F" | grep -a "${CAMERAMODEL}" | sed -e "s/^.*:.//" | sed "s/ /_/g"`
  NAME=`basename "$F"` 
  #папка куда перемещать
  DIR="${BASEDIR}/${YEAR}/${MONTHS[$MONTH]}/${MODEL}" 
  mkdir -p "${DIR}" 
  mv -f "${F}" "${DIR}/${NAME}"
  echo "${DIR}/${NAME}" 
done
echo "Отсортировано."
