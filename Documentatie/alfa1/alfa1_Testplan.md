# Alfa1 testplan

*Vooraf:* machine alfa1 werd geprovisioned aan de hand van commando `vagrant up alfa1` en doorloopt succesvol het playbook.

## Alfa1: LDAP-server

### Verifieer dat service slapd running is
- Gebruik command `systemctl status slapd` om de status van de service te bekijken
- *Voldaan: slapd is running*

### Verifieer dat we de server via localhost kunnen bereiken
- Gebruik command `ldapsearch -x -LLL` om een query naar alle entries op de server via localhost uit te voeren
- *Voldaan: de query geeft een lijst van entries terug, waaronder de groepen en gebruikers die we hebben toegevoegd*

## Lima1: LDAP-client

### Verifieer dat we de server kunnen bereiken van op de client 
- Gebruik command `ldapsearch -x -LLL` om een query naar alle entries op de server uit te voeren
- *Voldaan: de query geeft een lijst van entries terug, deze is dezelfde als op de server*

### Verifieer dat onze gebruiker werd aangemaakt als systeemgebruiker
- Gebruik command `getent passwd` om een lijst van gebruikers en hun informatie te verkrijgen
- *Voldaan: gebruiker 'milan' is aanwezig in deze lijst*