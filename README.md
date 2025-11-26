
## Usage

- Install the application.
- A share folder named "Configuration" will be created.

- Either ssh into the box, or share the "Configuration" folder, via NFS for example, or use the File Explorer.

- certbot-dns-bak/domains.conf
  *.example.com

- method.conf
  --dns-ovh --dns-ovh-credentials /share/Configuration/certbot-dns/ovh.conf

- ovh.conf
  Freeform

- de-activate and re-activate the application
- or run /usr/local/AppCentral/cappysan-certbot-dns/bin/certbot-renew
