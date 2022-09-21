#!/bin/bash
ROOTPASSWD=root
DBNAME=vagrant
DBUSER=vagrant
DBPASSWD=vagrantpass
echo "Creating new db $DBNAME"
mysql -uroot -p$ROOTPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$ROOTPASSWD -e "CREATE USER '$DBUSER'@'%' identified by '$DBPASSWD'"
mysql -uroot -p$ROOTPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'%'"
mysql -u$DBUSER -p$DBPASSWD -e "CREATE TABLE $DBNAME.vagranttbl(id INT PRIMARY KEY AUTO_INCREMENT, version FLOAT NOT NULL, software VARCHAR(50) NOT NULL)"
mysql -u$DBUSER -p$DBPASSWD -e "INSERT INTO $DBNAME.vagranttbl(version, software) VALUES(1.0, 'Apache')"
mysql -u$DBUSER -p$DBPASSWD -e "INSERT INTO $DBNAME.vagranttbl(version, software) VALUES(1.1, 'Apache')"
mysql -u$DBUSER -p$DBPASSWD -e "INSERT INTO $DBNAME.vagranttbl(version, software) VALUES(1.0, 'PHP')"
mysql -u$DBUSER -p$DBPASSWD -e "INSERT INTO $DBNAME.vagranttbl(version, software) VALUES(1.2, 'Apache')"