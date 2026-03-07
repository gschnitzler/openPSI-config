#!/usr/bin/bash

# TT variables to be setup in container backup cmd
WEEKDAY=$(date +%w)
BACKUPDIR="[% container.config.CONTAINER.PATHS.BACKUP %]"
DBPW="[% container.config.OPTIONS.MARIABACKUP_PW %]"

rm -rf $BACKUPDIR/$WEEKDAY
mkdir -p $BACKUPDIR/$WEEKDAY

# create full backup
mariadb-backup --backup --user=mariabackup --password="$DBPW" --target_dir=$BACKUPDIR/$WEEKDAY 2>&1
# fix files
mariadb-backup --prepare --target_dir=$BACKUPDIR/$WEEKDAY 2>&1

