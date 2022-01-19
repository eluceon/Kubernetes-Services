#!/bin/bash

# Initializes the DB data directory and creates the system tables
# in the mysql database, if they do not exist.
mysql_install_db --datadir=/var/lib/mysql

# Starts mysqld with some extra safety features
mysqld_safe -u root & sleep 5

# Creates database wordpress, user and password
mysql -u root -e "CREATE DATABASE wordpress; \
				GRANT ALL PRIVILEGES ON wordpress.* TO 'eluceon'@'%' \
				IDENTIFIED BY 'eluceon'; \
				FLUSH PRIVILEGES;"

# Imports database backup
mysql wordpress -u root < wordpress.sql

# Avoids container to stop
sleep infinity & wait
