FROM alpine:3.7


LABEL maintainer="Stuart Bannerman me@stuartbannerman.com"
LABEL version="0.0.1"
LABEL description="A Docker image containing a Alpine package repository"
LABEL repository="https://github.com/m3talstorm/docker-alpine-mirror"


RUN apk update && apk add --no-cache \
    lighttpd=1.4.48-r0 \
    && rm -rf /var/cache/apk/*


COPY lighttpd.conf /etc/lighttpd/lighttpd.conf


EXPOSE 80


CMD ["lighttpd", "-f", "/etc/lighttpd/lighttpd.conf", "-D"]
