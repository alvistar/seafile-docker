#!/bin/sh

set -eu
set -x

cd /opt/seafile/seafile-server-*
./setup-seafile-mysql.sh

rm /etc/service/seafile/down
rm /etc/service/seahub/down