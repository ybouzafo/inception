# mkdir -p /run/php/

# sleep 10
# #afin d'etre certain que la base de donnees Mariadb a bien eu le temp de se lancer correctement ?? plus de detail
# wp config create	--allow-root \
# 						--dbname=$SQL_DATABASE \
#                         --dbuser=$SQL_USER \
# 						--dbpass=$SQL_PASSWORD \
# 						--dbhost=mariadb:3306 --path='/var/www/wordpress'



# # #!/bin/bash

# # # Créer les répertoires nécessaires
# # mkdir /var/www/
# # mkdir /var/www/html

# # cd /var/www/html

# # # Supprimer les fichiers WordPress existants
# # rm -rf *

# # # Télécharger WP-CLI
# # curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
# # chmod +x wp-cli.phar 
# # mv wp-cli.phar /usr/local/bin/wp

# # # Télécharger et installer WordPress
# # wp core download --allow-root
# # mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# # # Modifier wp-config.php pour la connexion à la base de données
# # sed -i "s/database_name_here/$DB_NAME/g" wp-config.php
# # sed -i "s/username_here/$DB_USER/g" wp-config.php
# # sed -i "s/password_here/$DB_PASSWORD/g" wp-config.php
# # sed -i "s/localhost/$DB_HOST/g" wp-config.php

# # # Installer WordPress et configurer le site
# # wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

# # # Créer un utilisateur
# # wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

# # # Installer le thème Astra
# # wp theme install astra --activate --allow-root

# # # Installer le plugin Redis Cache
# # wp plugin install redis-cache --activate --allow-root

# # # Activer Redis
# # wp redis enable --allow-root

# # # Démarrer PHP-FPM
#  /usr/sbin/php-fpm7.3 -F

#!/bin/bash


wait_for_mariadb() {
    until mysqladmin -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} ping; do
      echo "Waiting for MariaDB to start..."
      sleep 5
    done
  if [ ! -f /var/www/wordpress/wp-config.php ]; then
      chown -R www-data /var/www/wordpress
      chmod -R 775 /var/www/wordpress
      mkdir -p /run/php/
      touch /run/php/php8.2-fpm.pid
      curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
      chmod +x wp-cli.phar
      mv wp-cli.phar /usr/local/bin/wp

      cd /var/www/wordpress
      wp core download --allow-root

      mv /var/www/wp-config.php /var/www/wordpress/
      wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${WORDPRESS_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL}
      wp user create ${WORDPRESS_SECOND_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${WORDPRESS_SECOND_USER_PASSWORD} --role=author --allow-root

      # chown -R www-data:www-data /var/www/wordpress/wp-content
      # chmod -R 755 /var/www/wordpress/wp-content
      
      wp theme install inspiro --activate --allow-root
      wp plugin install redis-cache --activate --allow-root
      wp plugin update --all --allow-root
      wp plugin activate redis-cache --allow-root
      wp redis enable --allow-root
      chown -R www-data:www-data /var/www/wordpress

      # Adjust directory permissions to 755
      find /var/www/wordpress -type d -exec chmod 755 {} \;

      # Adjust file permissions to 644
      find /var/www/wordpress -type f -exec chmod 644 {} \;

      # Ensure that wp-content/uploads directory is writable
      chown -R www-data:www-data /var/www/wordpress/wp-content/uploads
      chmod -R 755 /var/www/wordpress/wp-content/uploads
      echo "Wordpress Launched SUCCESSFULLY"
  fi
}
wait_for_mariadb

/usr/sbin/php-fpm8.2 -F