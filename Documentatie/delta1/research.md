# Research

Dit document beschrijft alle resources die nuttig zijn voor server Delta1.

## Links

- [Postfix antispam+virus](https://www.tecmint.com/integrate-clamav-and-spamassassin-to-protect-postfix-mails-from-viruses/)
- [Clam AV](https://www.linux.com/tutorials/using-clamav-kill-viruses-postfix/)
- [SELinux booleans](https://www.thegeekdiary.com/understanding-selinux-booleans/)
- [configure mailserver](https://xdeb.org/post/2018/02/07/run-your-own-mail-server-with-postfix-and-dovecot/)
- [Setup E-mail Server Centos](https://hostpresto.com/community/tutorials/how-to-setup-an-email-server-on-centos7/)
- [Postfix hardening](https://linux-audit.com/postfix-hardening-guide-for-security-and-privacy/)

## Ansible roles

- Mailserver (postfix, dovecot): [bertvv.mailserver](https://galaxy.ansible.com/bertvv/mailserver)
- Squirrelmail: [bertvv.squirrelmail](https://galaxy.ansible.com/bertvv/squirrelmail)
- Clam AV: [jtyr.clamav](https://galaxy.ansible.com/jtyr/clamav)

## Commands

| Commando                     | Uitvoering                                   |
| :----------------------------| :--------------------------------------------|
| `journalctl -f`              | laatste logberichten volgen                  |
| `setsebool [boolean] on|off` | zet selinux boolean aan of af                |
| `getsebool [boolean]`        | geeft aan of de selinux boolean aanstaat     |
| `./scripts/dependencies.sh ./ansible/servers.yml`| Ophalen van Ansible roles|


## Testen

Om te testen met gebruikers die lokaal zijn aangemaakt moet er in `/etc/postfix/master.cf` de lijn `-o smtpd_client_restrictions=permit_sasl_authenticated,reject` in commentaar gezet worden. Dit moet zo omdat lokale gebruikers anders geen toegang wordt gegeven om mails te versturen/ontvangen. 

Na dit aangepast te hebben moet `Postfix` vervolgens gereload worden door middel van het commando `sudo postfix reload`.
