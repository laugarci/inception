#! /bin/bash
service mysql start

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ];
then
	mysql -u ${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE $MYSQL_DATABASE;"
	mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
	mysql -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
	mysql -e "FLUSH PRIVILEGES;"
fi

mysqladmin -u ${MYSQL_ROOT_USER} --password=${MYSQL_ROOT_PASSWORD} shutdown

mysqld
