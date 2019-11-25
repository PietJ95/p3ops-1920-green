# Alfa1 testplan

*Vooraf:* 
- machine alfa1 en lima1 destroyen aan de hand van het commando `vagrant destroy alfa1 lima1`
- machine alfa1 werd geprovisioned aan de hand van commando `vagrant up alfa1` en doorloopt succesvol het playbook.
- machine lima1 werd geprovisioned aan de hand van commando `vagrant up lima1` en doorloopt succesvol het playbook.

## Testen alfa1
- maak een ssh-verbinding aan de hand van het commando `vagrant ssh alfa1`
- controleer of LDAP-service runt aan de hand van het commando `systemctl status slapd`
  - status is active (running) 
- user aanmaken
  - LDIF aanmaken in homefolder
    ```Define a person here
    dn: uid=testuser,dc=green,dc=local
    objectClass: top
    objectClass: person
    objectClass: posixAccount
    objectClass: shadowAccount
    cn: testuser
    sn: testuser
    uid: testuser
    userPassword: test123
    gidNumber: 100
    uidNumber: 1234
    homeDirectory: /home/testuser
    loginShell: /bin/bash
    gecos: testuser
    shadowLastChange: 12
    shadowMax: 10000000
    shadowWarning: 0
    ```
  - voeg user toe aan de hand van het commando ` ldapadd -h localhost -x -D "cn=Manager,dc=green,dc=local" -w letmein -f testuser.ldif`
- Verifieer dat we de server via localhost kunnen bereiken met het commando `ldapsearch -x -LLL` om een query naar alle entries op de server via localhost uit te voeren
  - alle entries kunnen zien inclusief de nieuwe testuser



## Testen op client (lima1)
- maak een ssh-verbinding aan de hand van het commando `vagrant ssh lima1`
- aanmelden `su milan`
- Verifieer dat we de server via ip kunnen bereiken
  - Gebruik command `ldapsearch -x -LLL` om alle entries van de server op te vragen
- Verifieer dat onze gebruiker werd aangemaakt als systeemgebruiker
  - Gebruik command `getent passwd` om een lijst van gebruikers en hun informatie te verkrijgen
- groepen controleren via `getent group`



