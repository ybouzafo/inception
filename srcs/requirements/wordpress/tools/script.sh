#!/bin/bash

sleep 10

wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --allow-root --skip-check
wp core install --url=$DOMAIN_NAME --title=$WP_ADMIN_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
wp user create $WP_USER_LOGIN $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=$WP_USER_ROLE --allow-root
/usr/sbin/php-fpm7.4 -F
