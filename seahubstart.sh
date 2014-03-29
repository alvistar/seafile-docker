#!/bin/sh

set -eu
set -x

/opt/seafile/seafile-server-latest/seahub.sh start >> /opt/seafile/logs/seahub.init.log

while [ 1 ]; do
  sleep 10
done