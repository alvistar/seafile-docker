#!/bin/sh

set -eu
set -x

exec dnsmasq -A /MYSQL/$DB_PORT_3306_TCP_ADDR -S 8.8.8.8 -S 4.4.4.4 -d