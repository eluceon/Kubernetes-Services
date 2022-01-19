FROM  alpine:3.12

LABEL maintainer="eluceon@student.21-school.ru"

RUN apk update && apk upgrade
RUN apk add nginx sudo bash openssh openssl \
	&& rm -rf /var/cache/apk/*

# Creating new user and group 'www' for nginx
# Create a directory for html files
RUN adduser -D -g 'www' www \
	&& mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www

RUN mkdir -p var/run/nginx

# Config NGINX
# Backup of original nginx.conf file before writting my own
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.conf /etc/nginx/

# SSL
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/ssl/certs/eluceon.pem -keyout /etc/ssl/certs/eluceon.key \
	-subj "/C=RU/ST=Moscow/L=Moscow/O=21-school/OU=eluceon/CN=eluceon"

# SSH
RUN adduser -D eluceon && echo 'eluceon:eluceon' | chpasswd \
	&& addgroup eluceon wheel && echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel \
	&& ssh-keygen -A

COPY index.html /www/
COPY start_nginx.sh /tmp/start_nginx.sh
RUN chmod 644 /tmp/start_nginx.sh

EXPOSE 80 443 22

ENTRYPOINT ["bash", "/tmp/start_nginx.sh"]
