#!/bin/sh

set -e

# Make sure we never run 2 rsync at the same time
lockfile="/tmp/alpine-mirror.lock"
if [ -z "$flock" ] ; then
  exec env flock=1 flock -n $lockfile $0 "$@"
fi

src=rsync://rsync.alpinelinux.org/alpine/
dest=/var/www/localhost/htdocs/alpine/

/usr/bin/rsync -prua \
    --exclude-from /etc/rsync/exclude.txt \
    --delete \
    --timeout=120 \
    --delay-updates \
    --delete-after \
    --log-file=/var/log/.rsyncd.log \
    "$src" "$dest"
