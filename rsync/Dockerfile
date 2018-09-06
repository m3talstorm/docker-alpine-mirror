FROM alpine:3.7


LABEL maintainer="Stuart Bannerman me@stuartbannerman.com"
LABEL version="0.0.1"
LABEL description="A Docker image containing the rsync component for automatic updating of the Alpine package repository"
LABEL repository="https://github.com/m3talstorm/docker-alpine-mirror"


RUN apk update && apk add --no-cache \
    rsync=3.1.3-r0 \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /var/www/localhost/htdocs/alpine


COPY rsync.sh /etc/periodic/hourly/package-rsync
COPY exclude.txt /etc/rsync/exclude.txt


CMD ["crond", "-f", "-d", "6"]
