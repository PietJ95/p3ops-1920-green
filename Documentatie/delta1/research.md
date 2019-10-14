# Research

Dit document beschrijft alle resources die nuttig zijn voor server Delta1.

## Links

- [Postfix antispam+virus](https://www.tecmint.com/integrate-clamav-and-spamassassin-to-protect-postfix-mails-from-viruses/)
- [Clam AV](https://www.linux.com/tutorials/using-clamav-kill-viruses-postfix/)
- [SELinux booleans](https://www.thegeekdiary.com/understanding-selinux-booleans/)

## Ansible roles

- Mailserver (postfix, dovecot): [bertvv.mailserver](https://galaxy.ansible.com/bertvv/mailserver)
- Squirrelmail: [bertvv.squirrelmail](https://galaxy.ansible.com/bertvv/squirrelmail)
- Clam AV: [jtyr.clamav](https://galaxy.ansible.com/jtyr/clamav)

## Commands

| Commando                     | Uitvoering                               |
| :--------------------------- | :--------------------------------------- |
| `journalctl -f`              | laatste logberichten volgen              |
| `setsebool [boolean] on|off` | zet selinux boolean aan of af            |
| `getsebool [boolean]`        | geeft aan of de selinux boolean aanstaat |