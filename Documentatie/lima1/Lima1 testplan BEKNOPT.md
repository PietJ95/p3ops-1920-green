# Testplan Lima1

Author: [Jonas Spitaels](https://github.com/JonasSpitaels) & [Berkant Kücüksolak](https://github.com/BerkantKs)





# BIJKOMENDE INFORMATIE (NIET NODIG)

Om de Lima1 fileserver op te zetten dienen de rollen rhbase (bertvv.rh-base), samba (bertvv.samba) en client voor openldap (openldap-client) geïnstalleerd te worden. Aangezien Alfa1 momenteel nog aan het werken is aan de integratie (met de openldap-client rol) van de door hun aangemaakte groepen (users zijn al in orde) zodat Lima1 deze kan gebruiken en hiervoor Samba users en shares kan aanmaken, werkt Lima1 voorlopig op lokaal aangemaakte users en groups. Hopelijk kan dit tegen de uiteindelijke release gefixt worden. Hieronder zijn een onderdeel 'Lokaal' en een onderdeel 'Met integratie' aangemaakt. 




# NODIGE INFO

Om Lima1 voorlopig te testen moet de code onder 'Lokaal' in het 'Lima1.yml' bestand komen. Eens je daarna 'vagrant up lima1' en daarna 'vagrant provision lima1'doet, en er normaal 0 fouten zijn, doe je 'vagrant ssh lima1'. Vervolgens controleer je a.d.h.v. de testcode bij het onderdeel 'Testcode' of de fileserver naar behoren werkt.




## Lokaal




#--firewall-----------------------------#
rhbase_firewall_allow_services:
  - samba
#-------------------------------#

rhbase_user_groups:
  - IT_Administratie
  - Verkoop
  - Administratie
  - Ontwikkeling
  - Directie 

samba_load_homes: true

#--users-----------------------------#
rhbase_users: 
  - name: Robert
    comment: 'Robert'
    password: 'abc123!'
    groups: 
      - IT_Administratie
      - Verkoop
      - Administratie
      - Ontwikkeling
      - Directie
  - name: Els
    comment: 'Els'
    password: 'cba321!'
    groups: 
      - IT_Administratie
      - Verkoop
      - Administratie
      - Ontwikkeling
      - Directie
  - name: Thomas
    comment: 'Thomas'
    password: 'def123!'
    groups: 
      - Directie
  - name: Noah
    comment: 'Noah'
    password: 'fed321!'
    groups: 
      - Directie
  - name: Emma
    comment: 'Emma'
    password: 'ghi123!'
    groups: 
      - Verkoop
  - name: Louise
    comment: 'Louise'
    password: 'ihg321!'
    groups: 
      - Verkoop
      - Administratie
  - name: Marie
    comment: 'Marie'
    password: 'jkl123!'
    groups: 
      - Ontwikkeling
  - name: Lucas
    comment: 'Lucas'
    password: 'ljk321!'
    groups: 
      - Ontwikkeling
      - IT_Administratie
  - name: Viktor
    comment: 'Viktor'
    password: 'mno123!'
    groups: 
      - IT_Administratie
  - name: Sarah
    comment: 'Sarah'
    password: 'onm321!'
    groups: 
      - IT_Administratie
      - Verkoop
  - name: Jade
    comment: 'jade'
    password: 'pqr123!'
    groups: 
      - Administratie
  - name: Lars
    comment: 'Lars'
    password: 'rqp321!'
    groups: 
      - IT_Administratie
      - Administratie
     


samba_users:
  - name: Robert
    password: abc123!
  - name: Els
    password: cba321!
  - name: Thomas
    password: def123!
  - name: Noah
    password: fed321!
  - name: Emma
    password: ghi123!
  - name: Louise
    password: ihg321!
  - name: Marie
    password: jkl123!
  - name: Lucas
    password: ljk321!
  - name: Viktor
    password: mno123!
  - name: Sarah
    password: onm321!
  - name: Jade
    password: pqr123!
  - name: Lars
    password: rqp321!

samba_shares:
  - name: IT_Administratie
    group: IT_Administratie
    valid_users: +IT_Administratie
    write_list: +IT_Administratie
  - name: Verkoop
    group: Verkoop
    valid_users: +Verkoop
    write_list: +Verkoop
  - name: Administratie
    group: Administratie
    valid_users: +Administratie
    write_list: +Administratie
  - name: Ontwikkeling
    group: Ontwikkeling
    valid_users: +Ontwikkeling
    write_list: +Ontwikkeling
  - name: Directie
    group: Directie
    valid_users: +Directie
    write_list: +Directie





## Met integratie



## TESTCODE (4 tests)

1. est of de samba shares aangemaakt en dus beschikbaar zijn

Geef het volgende commando in: smbclient -L //lima1/
Er wordt daarna een wachtwoord gevraagd. Voer het volgende wachtwoord in: vagrant
Nu krijg je een overzicht van alle 5 de shares te zien.


2.  Test of je met samba user 'Viktor' kan inloggen op de share 'IT_Administratie' waar hij WEL toegangsrechten op heeft

Geef het volgende commando in: smbclient //lima1/IT_Administratie/ -UViktor%mno123!
Je krijgt nu normaal deze prompt te zien: smb: \>
Dit wil zeggen dat je ingelogd bent op de IT_Administratie share.


3. Test of je met samba user 'Viktor' kan inloggen op de share 'Administratie' waar hij GEEN toegangsrechten op heeft

Geef het volgende commando in: smbclient //lima1/Administratie/ -UViktor%mno123!
Je krijgt nu normaal deze error output te zien: 'NT_STATUS_ACCESS_DENIED'
Dit wil zeggen dat je als Viktor niet kan inloggen op de Administratie share.


4.  Test of je op een share kan inloggen als een gast op de 'dministratie' (of 1 van de 4 andere) share

Geef het volgende commando in: smbclient //lima1/Administratie -U%
Je krijgt nu normaal deze error output te zien: 'NT_STATUS_ACCESS_DENIED'
Dit wil zeggen dat je als gast niet kan inloggen op de Administratie (of 1 van de 4 andere)share.

---