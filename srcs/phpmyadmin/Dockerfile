FROM  alpine:3.12

LABEL maintainer="eluceon@student.21-school.ru"

RUN apk update && apk upgrade
RUN apk add nginx bash wget

# PHP7 Installation
RUN apk add php7 php7-fpm php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session

# Creating new user and group 'eluceon' for nginx and directory for phpmyadmin
RUN adduser -D -g 'eluceon' eluceon \
	&& mkdir -p /www/phpmyadmin \
	&& chown -R eluceon:eluceon /var/lib/nginx \
	&& chown -R eluceon:eluceon /www

RUN mkdir -p var/run/nginx

# Config NGINX
# Backup of original nginx.conf file before writting my own
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY ./nginx.conf /etc/nginx/

# Doownlowd phpmyadmin and copy config
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz\
	&& tar -C /www/phpmyadmin -xvzf phpMyAdmin-5.0.4-english.tar.gz --strip-components 1 \
	&& rm -rf phpMyAdmin-5.0.4-english.tar.gz

COPY config.inc.php /www/phpmyadmin
COPY start_phpmyadmin.sh /tmp/start_phpmyadmin.sh
RUN chmod 644 /tmp/start_phpmyadmin.sh

EXPOSE 5000

ENTRYPOINT ["bash", "/tmp/start_phpmyadmin.sh"]
