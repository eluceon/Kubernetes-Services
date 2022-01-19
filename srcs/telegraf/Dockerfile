FROM  alpine:3.12

LABEL maintainer="eluceon@student.21-school.ru"

RUN apk update && apk upgrade \
	&& apk add -X http://dl-cdn.alpinelinux.org/alpine/edge/community/ telegraf\
	&& mkdir -p /etc/telegraf \
	&& rm -rf /var/cache/apk/*

COPY telegraf.conf /etc/telegraf/

ENTRYPOINT telegraf --config /etc/telegraf/telegraf.conf
