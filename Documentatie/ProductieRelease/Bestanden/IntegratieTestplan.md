# Integratie testplan
## Productie release 18 november
### Requirements
  * 

### Vooraf
Alle servers werden geïnitialiseerd met het commando ```vagrant up```. Controleer dat alle servers up and running zijn met het commando ```vagrant status```. Dit ziet er als volgt uit: 
```
/// te doen maandag
```
### Stappenplan 
#### 1. Netwerk & server opstellen (R&S & Productie-omgeving)
#### 2. Kilo1 (DHCP)
#### 3. Alfa1 (Domeinserver)
* [ ] Verifieer dat service **slapd** running is.
    * Gebruik command ```systemctl status slapd``` om de status van de service te bekijken.
* [ ] Controleer of we de server via localhost kunnen bereiken.
    * Gebruik command ```ldapsearch -x -LLL``` om een query naar alle entries op de server via localhost uit te voeren.
    * Verwacht: De query geeft een lijst van entries terug, waaronder de groepen en gebruikers die we hebben toegevoegd.
        * Welke groepen en gebruikers? 
#### 4. Bravo1 & Charlie1 (DNS)
#### 5. Oscar1 (Monitoring-systeem)
##### Promotheus website
* [ ] Verifieer of de Prometheus website bereikbaar en zichtbaar is. 
  * Surf naar '172.16.1.5:9090' om de Prometheus website te bereiken.
* [ ] Controleer of alle servers actief zijn.
  * Ga naar *Status > Targets* om dit te controleren. 
    * Alle servers moet onder het hoofding *Prometheus* als **state** *up* hebben in de tabel.
    * Alle routers, switches en firewalls moeten onder de hoofding *SNMP* als **state** *up* hebben.#
#### Grafana dashboards
* [ ] Verifieer of de Grafana website bereikbaar en zichtbaar is. 
  * Surf naar '172.16.1.5:3000' om de Prometheus website te bereiken.
* [ ] Test indien je op deze website met volgende gegevens kunt aanmelden:
    - **Gebruikersnaam**: admin
    - **Wachtwoord**: oscar1
#### Node Exporter Server Metrics Dashboard
* [ ] Toets indien je nergens de foutmelding *No data* krijgt. 
    * Ga naar *Home (linksboven) > Node Exporter Server Metrics*.
    * Selecteer de gewenste servers bij *Node* (linksboven).
    * Verander de tijd (*rechtsboven*) van *Last 7 days* naar *Last 5 minutes*
    * Krijg je nergens de foutmelding *No Data*?
#### Node Exporter Full Dashboard
* [ ] Toets indien je nergens de foutmelding *No data* krijgt. 
    * Selecteer het dashboard *Node Exporter Full* (Links bovenaan, waar *Node Exporter Server Metrics*)
    * Kies de gewenste server bij *Host* (linksboven).
    * Verander de tijd (*rechtsboven*) van *Last 7 days* naar *Last 5 minutes*.
    * Krijg je nergens de foutmelding *No Data*?
##### SNMP Interface Througput Dashboard
* [ ] Toets indien je nergens de foutmelding *No data* krijgt.
    * Selecteer het dashboard *SNMP Interface Throughput* (Links bovenaan, waar *Node Exporter Server Metrics*)
    * Kies de gewenste server bij *Host* (linksboven)
    * Verander de tijd (*rechtsboven*) van *Last 7 days* naar *Last 5 minutes*
    * Krijg je nergens de foutmelding *No Data*?
#### 6. Papa1 (PXEBoot-server)
#### 7. Quebec1 (Forwarding DNS)
#### VM Testen
* [ ] Onderzoek of de FQDN(Fully Qualified Domain Name) is ingesteld op quebec1.green.local?
  * Gebruik het commando ```hostname``` om dit te controleren. 

## NSLookups Testen
### Alfa1
```bash
nslookup alfa1
```
Dit moet teruggeven: 172.16.1.?

### Bravo1
```bash
nslookup bravo1
```
Dit moet teruggeven: 172.16.1.?

### Charlie1
```bash
nslookup charlie1
```
Dit moet teruggeven: 172.16.1.?

### Delta1
```bash
nslookup delta1
```
Dit moet teruggeven: 172.16.1.?

### Echo1
```bash
nslookup echo1
```
Dit moet teruggeven: 172.16.1.?

### Kilo1
```bash
nslookup kilo1
```
Dit moet teruggeven: 172.16.1.?

### Lima1
```bash
nslookup lima1
```
Dit moet teruggeven: 172.16.1.?

### Mike1
```bash
nslookup mike1
```
Dit moet teruggeven: 172.16.1.?

### November1
```bash
nslookup november1
```
Dit moet teruggeven: 172.16.1.?

### Papa1
```bash
nslookup papa1
```
Dit moet teruggeven: 172.16.1.?

### Oscar1
```bash
nslookup oscar1
```
Dit moet teruggeven: 172.16.1.?

### Quebec1
```bash
nslookup quebec1
```
Dit moet teruggeven: 172.16.1.?

### Zulu1
```bash
nslookup zulu1
```
Dit moet teruggeven: 172.16.1.?

### www.hogent.be
```bash
nslookup www.hogent.be
```

Vindt deze de website terug?

### www.facebook.com
```bash
nslookup www.facebook.com
```

Vindt deze de website terug?
#### 8. November1 (MariaDB)
1. Is de MariaDB service gestart bij de boot?
    > *sudo systemctl status mariadb*
2. Is de MariaDB service 'Actief'?
    > *sudo systemctl status mariadb*
3. Bestaan de databanken 'drupal_echo1' en 'drupal_mike1'?
    > *mysql -uroot -p${mariadb_root_password} --execute 'show databases'*
4. Hebben de gebruikers 'mike1_user' en 'echo1_user' schrijfrechten voor de aangewezen databanken?
    > *mysql -u${mike1_user} -pmike1 \ --execute 'CREATE TABLE a (id int); DROP TABLE a;*
5.  De MariaDB mag geen testdatabank en anonieme gebruikers meer hebben,klopt dit?
    > *run mysql -uroot -p${mariadb_root_password} --execute 'show databases' test [ "0" -ne "${status}" ]*
    > *sudo systemctl list-units --type service*
3. Bestaan de databanken 'drupal_echo1' en 'drupal_mike1'?
    > *mysql -uroot -p${mariadb_root_password} --execute 'show tables'*
4. Hebben de gebruikers 'mike1_user' en 'echo1_user' schrijfrechten voor de aangewezen databanken?
    > *mysql -u${mike1_user} -pmike1 \ --execute 'CREATE TABLE a (id int); DROP TABLE a;*
5.  De MariaDB mag geen testdatabank en anonieme gebruikers meer hebben,klopt dit?
    > *run mysql -uroot -p${mariadb_root_password} --execute 'show tables' test [ "0" -ne "${status}" ]*
    > *result=$(mysql -uroot -p${mariadb_root_password} --execute "select * from user where user='';" mysql) [ -z "${result}" ]*
#### 9. Echo1 (Webserver)
#### 10. Mike1 (Content management systeem)
## Test toegangelijkheid

1. Ga naar www.green.local (of 172.16.1.69) in de browser
    * Expcted: Er wordt een webpagina of getoond
    * Opmerking: dns records voor www.green.local zijn vereist

## Test https

1. Ga naar https://www.green.local
    * Expected: https werkt en u krijgt een webpagina te zien

2. Ga naar http://www.green.local
    * Expected: http://www.green.local wordt geredirect naar https://www.green.local

## Test Drupal

1. Ga naar www.green.local
    * Expected: u krijgt de drupal homepage te zien

2. Klik op "Log in" en "Create a new account"
    * Expected: u krijgt een melding te zien dat het aangemaakte account op approval van de admin wacht

3. Ga terug naar de log in pagina en log in met de credentials van het admin account
    * Expected: u krijgt extra controls te zien

4. Ga naar de tab "People" en unblock de test user die u in stap 2 creëerde
    * Expected: de test user wordt successvol gedeblokkeerd

5. Edit de test user
    * Expected: u krijgt een pagina te zien waar u aanpassing aan de test user kan maken

6. Verander het password van de test user
    * Expected: het password is succesvol aangepast

7. Maak een article en basic page aan onder de content tab
    * Expected: het article en de basic page zijn succesvol aangemaakt
#### 11. Lima1 (Interne file-server)

#### 12. Delta1 (Mailserver)
1. Correct ip-adres

Run volgende commando's in terminal op de host

```
$ bats /vagrant/test/delta1/delta1.bats
```

2. Correcte default gateway

Wordt nagekeken in bovenstaande bats test.

3. Correcte firewall instellingen

Worden nagekeken in bovenstaande bats test.

4. Inloggen webportaal en mailbox bekijken in webbrowser

Open browser op url http://172.16.1.68/webmail

Log in met gegevens:

```
Name: johndoe
Password: test123
```

Klik op "INBOX" in de linkerkolom

5. Mail verzenden BINNEN domein

Klik op "Compose" bovenaan de webpagina en voer volgende gegevens in

```
To: ericdoe@green.local
Subject: anytesttexthere
```

en in het tekstveld:

```
Testtext in textarea from johndoe@green.local
```

Klik op "Sent" in de linkerkolom. Hier zou de mail moeten terechtkomen.

6. Mail verzenden BUITEN domein

Klik op "Compose" bovenaan de webpagina en voer volgende gegevens in

```
To: ericdoe@red.local
Subject: anytesttexthere
```

en in het tekstveld:

```
Testtext in textarea from johndoe@green.local
```

Klik op "Sent" in de linkerkolom. Hier zou de mail moeten terechtkomen.

7. Mail ontvangen BINNEN domein

Klik op "Sign Out" rechts bovenaan de webpagina. Log weer in met volgende gegevens:

```
Name: ericdoe
Password: test123
```

Hier zou de mail van "johndoe@green.local" moeten terechtkomen.

8. Mail ontvangen BUITEN domein

Deze test kan pas uitgevoerd worden in samenwerking met Windows-kant van het project.



#### Opgesteld door Olivier Troch en Joeri Verhavert
