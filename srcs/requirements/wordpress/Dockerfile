
FROM debian:latest


RUN apt update -y
RUN apt upgrade -y 
RUN  apt install php-fpm  -y 
RUN  apt install    mariadb-client -y
RUN  apt install   php-mysql  -y
RUN  apt install  curl -y

RUN apt-get install wget -y



RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www


RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN		chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/.

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp



# COPY ./conf/wp-config.php /var/www/html/wordpress/wp-config.php



COPY ./tools/script.sh .
RUN chmod +x script.sh
EXPOSE 9000

CMD ["bash"]


