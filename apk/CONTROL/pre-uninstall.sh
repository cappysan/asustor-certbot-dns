#!/usr/bin/env sh
# SPDX-License-Identifier: MIT
#
# Before deleting the user, we must change permissions to root.
#
. /usr/local/AppCentral/cappysan-certbot/.env.install
cd ${APKG_PKG_DIR:-/nonexistent} || exit 1

# Change the permissions before keeping the configuration
if test "x${APKG_PKG_STATUS}" != "xupgrade"; then
  chown -R root:root ${APKG_CFG_DIR}
fi

# Remove the crontab line
crontab -l | sed '/cappysan-certbot/d' | crontab -

rm -f /etc/letsencrypt

exit 0
