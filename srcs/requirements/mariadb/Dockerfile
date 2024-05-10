# # FROM debian:buster

# # RUN apt-get update
# # #upgrade
# # RUN apt-get install vim -y
# # RUN apt-get install mariadb-server -y

# # ####################
# # # COPY ./conf/server.cnf /etc/mysql/my.cnf

# # COPY ./conf/50-server.conf	/etc/mysql/mariadb.conf.d/50-server.cnf

# # COPY ./tools/setup.sh /
# # RUN chmod +x ./setup.sh
# # # COPY ./tools/init.sql /docker-entrypoint-initdb.d/

# # EXPOSE 3306

# # CMD ["bash", "./setup.sh"]


# FROM debian:buster

# RUN apt update && apt upgrade -y

# RUN apt -q install -y mariadb-server && apt clean


# COPY ./tools/setup.sh /
# RUN chmod +x ./setup.sh

# #???
# # COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf



# EXPOSE 3306
# #export un port du container docker : cette commande permet a l'aplication executee
# #d'etre accessible depuis l'exterieur,


# # CMD :specifie la commande a executer lorsque le docker container demarre (dans le container)
# # CMD ["sh", "./setup.sh"]
# CMD ["bash", "./setup.sh"]

# #sh , abreviation de bash, l interpreteue des commande par defaut sous linux 
# # -c ; indique a bash . d'executer la commande suivante en tant que script,qu'elle interprète la commande et exécute les instructions qu'elle contient.
# #mysqld : est la commande pour demarer le serveur mariadb 

# #Exécutez le script setup.sh en tant que script.
# #Une fois le script terminé, lancez le serveur MariaDB.

FROM debian:11

RUN apt update && apt upgrade -y

RUN apt -q install -y mariadb-server && apt clean
#apt clean read in chatgpt.


COPY ./tools/setup.sh /
RUN chmod +x ./setup.sh

EXPOSE 3306

CMD ["bash", "./setup.sh"]