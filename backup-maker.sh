#!/bin/bash
#####
#  backup files script, version 1.
#
#  this script keeps one tar file per month for 12 months and rsyncs the entire contents
#  to $destination/daily_replica.
#  the idea is to run this script at least once per day to ensure proper sync and monthly tar.
#
#  created by Aaron @ www.devtrends.com
#####

# location of backup files (recursive sub-folders).
backup_files="/home/seyar/htwork"

# location to place tar files and /daily_replica/ directory.
destination="/home/seyar/backups"

#### no editing beyong this line is required!
#### function for TARing
funcTar()
{
 options="--create --file="
 echo " -- tar'ing up $1 to $2/$3"
 echo "   \ creating new archive file: $3"
 tar $options$2/$3 $1
 echo "   \ tar backup completed."
}
#### end funcion

#### CREATE MONTHLY TAR FILE
# Create new archive filename.
#month=$(date +%m)
#year=$(date +%Y)
#archive_file="backup-$month.tar"
#full_path_archive_file="$destination/$archive_file"

#### CREATE DAILY TAR FILE
# Create new archive filename.
day=$(date +%d)
month=$(date +%m)
year=$(date +%Y)
archive_file="backup-$day.$month.$year.tar"
full_path_archive_file="$destination/$archive_file"


# do I need to create a new monthly archive file?
# check if the file exists
if [ -f $full_path_archive_file ]; then

 # get file date
 filedate=$(stat -c %y $full_path_archive_file)
 # extract only the year of the file
 filedate=${filedate:0:4}

 # check if the file year is not the current year
 if [ ! $filedate == $year ]; then

 # remove old file
 rm $full_path_archive_file
 # create new tar
 funcTar $backup_files $destination $archive_file

 else

 echo " -- no tar'ing required today."

 fi

else

 # create new tar
 funcTar $backup_files $destination $archive_file

fi
#### DONE WITH TAR

#### rsync time...
echo " -- rsync $backup_files to $destination/daily_replica"
rsync -a $backup_files $destination/daily_replica
echo "   \ rsync completed."
####
