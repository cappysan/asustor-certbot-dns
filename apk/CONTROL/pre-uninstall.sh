#!/usr/bin/env sh
#
# Remove the crontab line
crontab -l | sed '/cappysan-certbot/d' | crontab -

rm -f /etc/letsencrypt
