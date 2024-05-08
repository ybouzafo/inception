FROM debian:buster

RUN apt-get update
#upgrade
RUN apt-get install vim -y
RUN apt-get install mariadb-server -y

# COPY ./conf/server.conf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/setup.sh /

CMD ["bash", "./setup.sh"]