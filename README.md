# Asustor - Certbot

Asustor APK package for Certbot, the free, open source software tool certificate generator.


## Table of contents
1. [Installation](#installation)  
2. [Configuration](#configuration)  
3. [Help Wanted](#help)  
4. [Support & Sponsorship](#support)  
5. [License](#license)  
6. [Links](#links)  


## Installation <a name="installation"></a>

The APK application is available as a GitLab release, and on [https://asustor.cappysan.dev/](https://asustor.cappysan.dev/)

The APK application is not available as an Asustor App Central application as Asustor does not accept duplicates, even if one is DNS verification based and not the other, nor applications without a UI.


## Configuration <a name="configuration"></a>

- Install the application.

- A share folder named "Configuration" will be created.

- To be able to edit the "Configuration" folder:

  - Either ssh as root into the box, and enter the `/share/Configuration/certbot` folder;
  - Or, share the "Configuration" folder, via NFS for example, to edit it on your local machine;
  - Or, use the File Explorer builtin in the NAS interface;

- Edit the following files:

  - `certbot/domains.conf`: Set the wildcard domain you wish to have certificates for.

  - `commandline.conf`: Enter a command line to run in addition to the default commands. For example: `--dns-ovh --dns-ovh-credentials /share/Configuration/certbot/ovh.conf`

  - `ovh.conf`: Free form file with credentials for OVH.

- Either:

  - De-activate and re-activate the application to generate the certificates;
  - Or, run `/usr/local/AppCentral/cappysan-certbot/bin/certbot-renew`

- Logs will be visible in command line, but also in the builtin syslog viewer on the NAS interface.


## Help Wanted <a name="help"></a>

This package could benefit for having a UI, in order to not need manual configuration.

Any help in creating this UI builtin the Asustor interface is appreciated.


## Support & Sponsorship <a name="support"></a>

You can help support this project, and all Cappysan projects, through the following actions:

- ⭐ Star the repository on GitLab, GitHub, or both to increase visibility and community engagement.

- 💬 Join the Discord community: [https://discord.gg/SsY3CAdp4Q](https://discord.gg/SsY3CAdp4Q) to connect, contribute, share feedback, and/or stay updated.

- 🛠️ Contribute by submitting issues, improving documentation, or creating pull requests to help the project grow.

- ☕ Support financially through [Buy Me a Coffee](https://buymeacoffee.com/cappysan), [Patreon](https://www.patreon.com/c/cappysan), [GitHub](https://github.com/sponsors/cappysan), or [Bitcoin (bc1qaz86l247df34h2q657c6zfs5l33r76s4ewxg4v)](https://addrs.to/pay/BTC/bc1qaz86l247df34h2q657c6zfs5l33r76s4ewxg4v). Your contributions directly sustain ongoing development and maintenance, including server costs.

Your support ensures these projects continue to improve, expand, and remain freely available to everyone.


## License <a name="license"></a>

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Please refer to the upstream software documentation for details on their respective licenses.


## Links <a name="links"></a>

  * Website: [https://asustor.cappysan.dev/](https://asustor.cappysan.dev/)
  * GitLab: [https://gitlab.com/cappysan/asustor/vim](https://gitlab.com/cappysan/asustor/certbot-dns)
  * GitHub: [https://github.com/cappysan/asustor-vim](https://github.com/cappysan/asustor-certbot-dns)
  * Discord: [https://discord.gg/SsY3CAdp4Q](https://discord.gg/SsY3CAdp4Q)
