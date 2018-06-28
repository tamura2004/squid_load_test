FROM alpine

MAINTAINER tamura <tamura2004@gmail.com>

RUN apk update \
	&& apk add squid \
	&& rm -rf /var/cache/apk/*

WORKDIR /etc

COPY sysctl.conf .
COPY profile .

WORKDIR squid

COPY squid.conf .
COPY start_squid.sh .

RUN chmod 777 start_squid.sh

CMD ["/etc/squid/start_squid.sh"]
