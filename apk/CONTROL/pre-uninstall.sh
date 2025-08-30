#!/usr/bin/env sh
#
# Remove the crontab line
crontab -l | sed '/certbot/d' | crontab -
