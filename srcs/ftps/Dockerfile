FROM  alpine:3.12

LABEL maintainer="eluceon@student.21-school.ru"

RUN apk update && apk upgrade \
	&& apk add openssl vsftpd bash \
	&& rm -rf /var/cache/apk/*

RUN mkdir -p /ftps/eluceon \
	&& adduser --home=/ftps/eluceon -D eluceon \
	&& echo 'eluceon:eluceon' | chpasswd \
	&& chmod -R 777 /ftps \
	&& chown -R eluceon:eluceon /ftps

# SSL
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/ssl/certs/vsftpd.pem -keyout /etc/ssl/certs/vsftpd.key \
	-subj "/C=RU/ST=Moscow/L=Moscow/O=21-school/OU=eluceon/CN=eluceon"

COPY ./vsftpd.conf /etc/vsftpd/
COPY start_ftps.sh /tmp/start_ftps.sh
RUN chmod 644 /tmp/start_ftps.sh

EXPOSE 20-21 21041-21044

ENTRYPOINT ["bash", "/tmp/start_ftps.sh"]
