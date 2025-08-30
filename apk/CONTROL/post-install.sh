#!/usr/bin/env sh
#
# Ensure permissions limit to root user.
chown -R 0:0 ${APKG_PKG_DIR}

# First, install a pipx application in a temporary folder
pip3 install --target ${APKG_TEMP_DIR} --force-reinstall --no-warn-script-location --progress-bar off --root-user-action=ignore --upgrade pipx

# Install the certbot application in the final destination folder
_OLD_PATH=${PATH}
PATH="${APKG_TEMP_DIR}/bin:${PATH}"

export PYTHONPATH="${APKG_TEMP_DIR}"
export PIPX_HOME=${APKG_PKG_DIR}
export PIPX_BIN_DIR=${PIPX_HOME}/bin
pipx install -f certbot==${APKG_PKG_VER%-*}
pipx inject -f certbot certbot-dns-ovh==${APKG_PKG_VER%-*}

# Since we zip with permissions retained, revert to root:root once
# installed.
chown -R 0:0 ${APKG_PKG_DIR}

# Create a configuration folder for this application
as_cfg=/share/Configuration/certbot

mkdir -p ${as_cfg}
chown root:root ${as_cfg}
chmod 700 ${as_cfg}

cp -rnv ${APKG_PKG_DIR}/conf.dist/* ${as_cfg}
chmod 600 ${as_cfg}/*.conf

# it's the only method for now
echo "ovh" > ${as_cfg}/method

# Make backup of the crontab
crontab -l > ${as_cfg}/crontab.$(date +%Y-%m-%d_%H%M%Y).bak

# Add a line to crontab
(crontab -l ; echo "0 */8 * * * ${APKG_PKG_DIR}/bin/certbot-renew") | sort | uniq | crontab -
