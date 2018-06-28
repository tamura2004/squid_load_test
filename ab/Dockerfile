FROM alpine

MAINTAINER tamura <tamura2004@gmail.com>

RUN apk update \
	&& apk add apache2-utils \
	&& apk add curl \
	&& apk add ruby \
	&& rm -rf /var/cache/apk/*

WORKDIR /tmp

COPY profile .
