#!/bin/bash

#==============================================================================
#TITLE:            dbclone.sh
#DESCRIPTION:      script to automate cloning a mysql database 
#AUTHOR:           jaimey
#VERSION:          0.1
#USAGE:            ./dbclone.sh

#==============================================================================
# CUSTOM SETTINGS
#==============================================================================

# MYSQL Parameters
MYSQL_UNAME=root
MYSQL_PWORD=2

MYSQL_DBSOURCE=crm7
MYSQL_DBDESTINATION=crm7pruebas

#==============================================================================
# METHODS
#==============================================================================

function mysql_login() {
  local mysql_login="-u $MYSQL_UNAME" 
  if [ -n "$MYSQL_PWORD" ]; then
    local mysql_login+=" -p$MYSQL_PWORD" 
  fi
  echo $mysql_login
}

#==============================================================================
# RUN SCRIPT
#==============================================================================

mysql $(mysql_login) -e "drop database $MYSQL_DBDESTINATION; CREATE DATABASE $MYSQL_DBDESTINATION DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;"
mysqldump $(mysql_login) $MYSQL_DBSOURCE > $MYSQL_DBDESTINATION.sql 
mysql $(mysql_login) $MYSQL_DBDESTINATION < $MYSQL_DBDESTINATION.sql

printf "DB clonned!\n\n"