# FROM debian:buster

# RUN apt-get upgrade -y
# RUN apt-get update 
# #return an error
# RUN apt-get install nginx -y 

# RUN apt-get install vim -y
# RUN apt-get install curl -y 
# #curl >?


# # installation de l'outil principal pour la gestion/creatin de certificat ssl, openssl;

# RUN apt-get update  && apt install openssl -y
# #read more about ssl

# #creation de dossier qui nous permetra de stocker le certificat et la clef (TLS)

# RUN mkdir -p /etc/nginx/ssl

# #generer certificat SSL et oui nous utilisons les outils ssl afin de creer un certificat TLS/SSL;

# RUN   openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=Bengurir/L=Bengurir/0=42/OU=1337/CN=ybouzafo.42.fr/UID=ybouzafo"



# #req : cree et traite principalememnt des demandes de certificats au format PKCS#10, elle peut en outre creer des certificat auto-signes;
# # -x509 : precise le type du certificat;

# #-nodes : notre clef privee de retrouvera simplememnt sans mot de passe;

# # -out : precise ou l'on souhaite stocker le certificat ;

# #keyout : precise ou l'on souhaite stocker la clef;

# # -subj  : Si nous lançons cette commande nous risquons d’avoir un prompt qui requiert certaines informations pour le certificat. 
# #           Heureusement, OpenSSL a encore prévu le coup et nous permet de les préremplir en rajoutant une option appelé    -subj


# # C : Pays (Country)
# # ST : État ou région (State or Province)
# # L : Ville ou localité (Locality)
# # O : Organisation (Organization)
# # OU : Unité d'organisation (Organizational Unit)
# # CN : Nom commun (Common Name)
# # UID : Identifiant unique (User ID)

# #---------------------------------------------------------------#

# #creer un dossier qui nous permettra de stocker les fichiers de config de nginx:
# # ??? why ??
# RUN mkdir -p /var/run/nginx 
# #-p ???
# COPY ./conf/nginx.conf /etc/nginx/nginx.conf


# # j ai pas compris >>?!
# # (notre root principal)
# RUN chmod 755 /var/www/html 
# # (l’utilisateur principal)
# # RUN chown -R www-data:www-data /var/www/html 

# CMD [ "nginx", "-g", "daemon off;" ]
# #cela lancera NGINX en premier plan pour que le container ne se stop pas.



 FROM debian:buster

RUN apt-get update -q
RUN apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/C=MA/ST=Benguerir/L=Benguerir/O=42/OU=1337/CN=ybouzafo.42.fr"

COPY ./conf/default etc/nginx/sites-enabled/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]