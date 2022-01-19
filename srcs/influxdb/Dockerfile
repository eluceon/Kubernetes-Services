FROM  alpine:3.12

LABEL maintainer="eluceon@student.21-school.ru"

RUN apk update && apk upgrade \
	&& apk add influxdb bash \
	&& rm -rf /var/cache/apk/*

EXPOSE 8086

ENTRYPOINT influxd run -config /etc/influxdb.conf
