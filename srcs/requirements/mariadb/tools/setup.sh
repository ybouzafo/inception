#  service mariadb start;
#  sleep 2

# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
# exec mysqld_safe



# # CREATE DATABASE IF NOT EXISTS wordpress;
# # CREATE USER IF NOT EXISTS 'wordpressuser'@'%' IDENTIFIED BY '1234';
# # GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'%';
# # FLUSH PRIVILEGES;
#!/bin/bash
service mariadb start 
sleep 1
  mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
  mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
  mariadb -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'%';"
  mariadb -e "FLUSH PRIVILEGES;"
  mysqladmin -u root shutdown
  mysqld_safe --bind-address=0.0.0.0