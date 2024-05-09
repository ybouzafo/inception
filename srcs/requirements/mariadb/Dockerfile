# FROM debian:buster

# RUN apt-get update
# #upgrade
# RUN apt-get install vim -y
# RUN apt-get install mariadb-server -y

# ####################
# # COPY ./conf/server.cnf /etc/mysql/my.cnf

# COPY ./conf/50-server.conf	/etc/mysql/mariadb.conf.d/50-server.cnf

# COPY ./tools/setup.sh /
# RUN chmod +x ./setup.sh
# # COPY ./tools/init.sql /docker-entrypoint-initdb.d/

# EXPOSE 3306

# CMD ["bash", "./setup.sh"]


FROM debian:buster

RUN apt update && apt upgrade -y

RUN apt -q install -y mariadb-server


COPY ./tools/setup.sh /
RUN chmod +x ./setup.sh

#???
COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf


EXPOSE 3306

CMD ["bash", "./setup.sh"]