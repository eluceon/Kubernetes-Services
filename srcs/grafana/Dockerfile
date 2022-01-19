FROM  alpine:3.12

LABEL maintainer="eluceon@student.21-school.ru"

RUN apk update && apk upgrade \
	&& apk add -X http://dl-cdn.alpinelinux.org/alpine/edge/community/ grafana \
	&& rm -rf /var/cache/apk/*

COPY /config/dashboards/* /usr/share/grafana/conf/dashboards/
COPY /config/provisioning/dashboards/* /usr/share/grafana/conf/provisioning/dashboards/
COPY /config/provisioning/datasources/* /usr/share/grafana/conf/provisioning/datasources/
# COPY /config/grafana.ini /usr/share/grafana/conf/

EXPOSE 3000

ENTRYPOINT [ "grafana-server", "--homepath=/usr/share/grafana" ]
