# FROM debian:buster

# RUN apt-get update

# RUN apt-get install wget -y

# RUN apt-get install vim -y 
# RUN apt-get install -y php7.3\
# 						php-fpm\
# 						php-mysql\
# 						mariadb-client


# #instalation de wordpress;  options -P , indique dans quel dossier on veut telecharger le fichier;

# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

# #Allez je vous aide, allons dans le dossier /var/www et utilisons tar -xvf suivi du fichier pour le décompresser et en obtenir le fameux dossier  wordpress !

# RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# #donne les droits a root d'ecrire :
# RUN		chown -R root:root /var/www/wordpress 
# #///// chmod ?? why not ;

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# COPY ./conf/auto_config.sh /usr/local/bin/auto_config.sh

# RUN chmod +x /usr/local/bin/auto_config.sh

# ENTRYPOINT ["/usr/local/bin/auto_config.sh"]


 FROM debian:buster
 # kanet debian:12 

RUN apt update; \
    apt install -y php8.2 php-mysqli php-fpm mariadb-client curl

# COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d
COPY ./conf /var/www/
COPY ./tools /var/www/

EXPOSE 9000

CMD ["bash", "/var/www/setup.sh"]