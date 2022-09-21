#!/bin/bash
echo "MySql provisioning - begin"
#installare mysql-server
sudo apt install mysql-server -y
#impostare la pw di root
sudo mysql -e "ALTER USER'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'"
#abilitare le connessioni da altri server
echo "Updating bind address"
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
#riavviare mysql in modo da applicare le modifiche
echo "Restarting mysql service"
sudo service mysql restart
echo "MySql provisioning - end"