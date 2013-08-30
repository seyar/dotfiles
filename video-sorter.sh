#!/bin/bash
#@depends on exiftool
#Входная папка
BASEDIR="./video"
#Бекапный винт
BACKUPDIR="/Volumes/Time Machine/"
#список не вложенных jpg файлов
#LIST=`find . -iname "*.jpg" -print0 -d 1`
#LIST=`ls | grep -i  ".jpg"`
#строка для грепа даты из экзива
STRTIME="^Media Modify Date"
STRTIME2="Date/Time Original"
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

echo "Введите название события: "
read EVENT 

find -E  . -iregex ".*\.(mov|3gp|mp4|avi)" -d 1 -print0 | while read -d $'\0' F 
do
  # выбираем маску для определения даты
  if [[ `exiftool "$F" | grep -a "${STRTIME}"` ]]; then
    STR=$STRTIME
  else
    STR=$STRTIME2
  fi;

  #Год обрезаем пробелы
  YEAR=`exiftool "$F" | grep -a "${STR}" | cut -d ':' -f2 | sed -e "s/ //g"`
 
  #Месяц ведущего без нуля
  MONTH=`exiftool "$F" | grep -a "${STR}" | cut -d ':' -f3 | sed -e s/0//` 
  #день
  #DAY=`exiftool "$F" | grep "${STRTIME}" | awk '{ print $4 }' | awk -F: '{ print $3 }'` 
  NAME=`basename "$F"` 
  #папка куда перемещать
  DIR="${BASEDIR}/${YEAR}/${MONTHS[$MONTH]}/${EVENT// /_}"

  mkdir -p "${DIR}" 
  mv -f "${F}" "${DIR}/${NAME}"
  echo "${DIR}/${NAME}" 
done
echo "Отсортировано."

if [ -d "${BACKUPDIR}photos/" ]; then 
  #забекапим на внешний винт. Все вместе с симлинкой
  #rsync -r -L $BASEDIR "${BACKUPDIR}photos/"
  echo "Синхронизировано с ${BACKUPDIR}"
else
  echo "Не синхронизировано."
fi;

