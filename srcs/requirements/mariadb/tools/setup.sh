service mysql start;
mysql -e "CREATE DATABASE IF NOT EXISTS \`${db_name}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${db_user}\`@'localhost' IDENTIFIED BY '${db_pwd}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${db_name}\`.* TO \`${db_user}\`@'%' IDENTIFIED BY '${db_pwd}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${db_pwd}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$db_name shutdown
exec mysqld_safe