#!/bin/sh

set -eu
set -x

/opt/seafile/seafile-server-latest/seafile.sh start >> /opt/seafile/logs/seafile.init.log

while [ 1 ]; do
  sleep 10
done


