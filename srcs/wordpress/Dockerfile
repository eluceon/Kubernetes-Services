FROM  alpine:3.12

LABEL maintainer="eluceon@student.21-school.ru"

RUN apk update && apk upgrade
RUN apk add nginx bash wget

# PHP7 Installation
RUN apk add php7 php7-fpm php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session

# Creating new user and group 'eluceon' for nginx and directory
RUN adduser -D -g 'eluceon' eluceon \
	&& mkdir -p /www/wordpress \
	&& chown -R eluceon:eluceon /var/lib/nginx \
	&& chown -R eluceon:eluceon /www

RUN mkdir -p var/run/nginx

# Config NGINX
# Backup of original nginx.conf file before writting my own
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY ./nginx.conf /etc/nginx/

# Wordpress Installation
RUN wget https://wordpress.org/wordpress-5.6.tar.gz \
	&& tar -C /www/wordpress/ -xvzf wordpress-5.6.tar.gz --strip-components 1\
	&& rm -rf wordpress-5.6.tar.gz \
	&& chown -R eluceon:eluceon /www/wordpress/ \
	&& chmod -R 755 /www/wordpress/

COPY wp-config.php /www/wordpress/
COPY start_wordpress.sh /tmp/start_wordpress.sh
RUN chmod 644 /tmp/start_wordpress.sh

EXPOSE 5050

ENTRYPOINT ["bash", "/tmp/start_wordpress.sh"]
