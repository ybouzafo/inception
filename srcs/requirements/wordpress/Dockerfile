FROM debian:oldstable

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y php-fpm php7.4-mysqli mariadb-client wget

RUN echo "listen= wordpress:9000" >> /etc/php/7.4/fpm/php-fpm.conf

RUN mkdir /run/php


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


WORKDIR /var/www/html/

RUN wp core download --allow-root



COPY ./tools/script.sh .
RUN chmod +x ./script.sh
EXPOSE 9000

CMD ["/bin/bash", "script.sh"]

