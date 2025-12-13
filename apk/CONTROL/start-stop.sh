#!/usr/bin/env sh
# SPDX-License-Identifier: MIT
#
# Use the presence/absence of a file to indicate if certbot should run.
#
# Make a link to simplify life
ln -sf -T $(realpath ./bin/certbot) /usr/bin/certbot

. /usr/local/AppCentral/cappysan-certbot/.env.install
cd ${APKG_PKG_DIR:-/nonexistent} || exit 1

if test ! -e /etc/letsencrypt; then
  mkdir -p ${APKG_CFG_DIR}/letsencrypt
  ln -sf -T ${APKG_CFG_DIR}/letsencrypt /etc/letsencrypt
fi

case $1 in
  start)
    touch "${APKG_CFG_DIR}/active"
    ./bin/certbot-renew
    ;;

  stop)
    rm -f "${APKG_CFG_DIR}/active" 2>/dev/null
    ;;

  restart)
    ./CONTROL/start-stop.sh stop
    ./CONTROL/start-stop.sh start
    ;;

  force-restart)
    ./CONTROL/start-stop.sh stop
    touch "${APKG_CFG_DIR}/active"
    ./bin/certbot-renew --force-renewal
    ;;

  *)
    echo "usage: $0 {start|stop|restart|force-restart}"
    exit 1
    ;;

esac
exit 0
