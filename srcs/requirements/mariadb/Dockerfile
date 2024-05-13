
FROM debian:latest

RUN apt update && apt upgrade -y

RUN apt  install -y mariadb-server 
#apt clean read in chatgpt.

# RUN  mkdir /run/mysqld 
# RUN touch /run/mysqld mysqld.sock 
COPY  ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.

COPY ./tools/script.sh .

RUN  chmod +x script.sh

EXPOSE 3306


CMD ["./script.sh"]