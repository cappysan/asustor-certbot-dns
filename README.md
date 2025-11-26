## Usage

- Install the application.

- A share folder named "Configuration" will be created.

- To be able to edit the "Configuration" folder:

  - Either ssh as root into the box, and enter the `/share/Configuration/certbot-dns` folder;
  - Or, share the "Configuration" folder, via NFS for example, to edit it on your local machine;
  - Or, use the File Explorer builtin in the NAS interface;

- Edit the following files:

  - `certbot-dns-bak/domains.conf`: Set the wildcard domain you wish to have certificates for.

  - `method.conf`: Enter a command line to run in addition to the default commands. For example: `--dns-ovh --dns-ovh-credentials /share/Configuration/certbot-dns/ovh.conf`

  - `ovh.conf`: Free form file with credentials for OVH.

- Either:

  - De-activate and re-activate the application to generate the certificates;
  - Or, run `/usr/local/AppCentral/cappysan-certbot-dns/bin/certbot-renew`

- Logs will be visible in command line, but also in the builtin syslog viewer on the NAS interface.
