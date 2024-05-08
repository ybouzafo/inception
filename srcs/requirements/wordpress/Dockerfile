FROM debian:buster

RUN apt-get update

RUN apt-get install wget -y

RUN apt-get install vim -y 
RUN apt-get install -y php7.3\
						php-fpm\
						php-mysql\
						mariadb-client


#instalation de wordpress;  options -P , indique dans quel dossier on veut telecharger le fichier;

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

#Allez je vous aide, allons dans le dossier /var/www et utilisons tar -xvf suivi du fichier pour le décompresser et en obtenir le fameux dossier  wordpress !

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

#donne les droits a root d'ecrire :
RUN		chown -R root:root /var/www/wordpress 
#///// chmod ?? why not ;


COPY config.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/config.sh
