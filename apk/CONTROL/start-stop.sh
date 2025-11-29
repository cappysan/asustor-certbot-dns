#!/usr/bin/env sh
#
# Use the presence/absence of a file to indicate if certbot should run.
#
as_cfg=/share/Configuration/certbot-dns
case $1 in
  start)
    touch "${as_cfg}/active"
    /usr/local/AppCentral/cappysan-certbot-dns/bin/certbot-renew
    ;;

  stop)
    rm -f "${as_cfg}/active" 2>/dev/null
    ;;

  restart)
    $0 stop
    $0 start
    ;;

  *)
    echo "usage: $0 {start|stop|restart}"
    exit 1
    ;;

esac
exit 0
