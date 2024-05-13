#!/bin/bash

sleep 10


# wp config create	--allow-root \
# 			--dbname=$SQL_DATABASE \
# 			--dbuser=$SQL_USER \
# 			--dbpass=$SQL_PASSWORD \
# 			--dbhost=mariadb:3306 --path='/var/www/wordpress'			

			

# Créer un dossier /run/php s'il n'existe pas déjà
mkdir -p /run/php

# Configurer WordPress avec WP-CLI en autorisant l'exécution en tant que superutilisateur
./wp-cli.phar config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress' --allow-root

# Installer WordPress avec WP-CLI en autorisant l'exécution en tant que superutilisateur
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=mot_de_passe_fort --admin_email=admin@admin.com --path='/var/www/wordpress' --allow-root

# Créer un deuxième utilisateur avec WP-CLI
./wp-cli.phar user create utilisateur2 utilisateur2@example.com --user_pass=mot_de_passe_2 --role=editor --path='/var/www/wordpress' --allow-root
	
            
/usr/sbin/php-fpm7.3 -F
