# Integratie testplan
## Requirements
  * De gehele opstelling werd volledige geautomatiseerd via ansible.
  * Elke server heeft een administrator account voor beheer vanop afstand.
  * elke server heeft zijn correct IP adres meegekregen via de DHCP server.
  * Elk component in het netwerk stuurt zijn informatie over de eigen werking naar het monitoringsysteem.
  * Alle servers worden eerst intern gecontroleerd met het testplan van het team dat verschillend is dan het integratie testplan.
  * De hostsystemen moeten voldoen aan volgende eigenschappen:
      * Het IP adres werd verkregen via de DHCP server.
      * ...

## A priori
* Het netwerk werd volledige opgesteld door het netwerk team.
* Alle servers werden geïnitialiseerd en zijn up and running.
    * Dit kan je controleren met het commando ``vagrant status``.
    * Dit ziet er als volgt uit:

```
/// te doen maandag
```
## Stappenplan
#### 1. Netwerk & server opstellen (R&S & Productie-omgeving)
#### 2. Kilo1 (DHCP)
#### 3. Alfa1 (Domeinserver)
###### LDAP server
* [ ] Verifieer dat service **slapd** running is.
    * Gebruik command ```systemctl status slapd``` om de status van de service te bekijken.
* [ ] Controleer of we de server via localhost kunnen bereiken.
    * Gebruik command ```ldapsearch -x -LLL``` om een query naar alle entries op de server via localhost uit te voeren.
* [ ] Controleer met vorige commando om je onderstaande gebruikers en groepen terug  vindt.
   * [ ] Groepen:
        * IT_Administratie
        * Verkoop
        * Administratie
        * Ontwikkeling
        * Directie
   * [ ] Gebruikers:
        * Milan Dewilde
#### 4. Bravo1 & Charlie1 (DNS)
#### 5. Oscar1 (Monitoring-systeem)
###### Promotheus website
* [ ] Verifieer of de Prometheus website bereikbaar en zichtbaar is.
  * Surf naar '172.16.1.5:9090' om de Prometheus website te bereiken.
* [ ] Controleer of alle servers actief zijn.
  * Ga naar *Status > Targets* om dit te controleren.
    * Alle servers moet onder het hoofding *Prometheus* als **state** *up* hebben in de tabel.
    * Alle routers, switches en firewalls moeten onder de hoofding *SNMP* als **state** *up* hebben.
###### Grafana dashboards
* [ ] Verifieer of de Grafana website bereikbaar en zichtbaar is.
  * Surf naar '172.16.1.5:3000' om de Prometheus website te bereiken.
* [ ] Test indien je op deze website met volgende gegevens kunt aanmelden:
    - **Gebruikersnaam**: admin
    - **Wachtwoord**: oscar1
###### Node Exporter Server Metrics Dashboard
* [ ] Toets indien je nergens de foutmelding *No data* krijgt.
    * Ga naar *Home (linksboven) > Node Exporter Server Metrics*.
    * Selecteer de gewenste servers bij *Node* (linksboven).
    * Verander de tijd (*rechtsboven*) van *Last 7 days* naar *Last 5 minutes*
    * Krijg je nergens de foutmelding *No Data*?
###### Node Exporter Full Dashboard
* [ ] Toets indien je nergens de foutmelding *No data* krijgt.
    * Selecteer het dashboard *Node Exporter Full* (Links bovenaan, waar *Node Exporter Server Metrics*)
    * Kies de gewenste server bij *Host* (linksboven).
    * Verander de tijd (*rechtsboven*) van *Last 7 days* naar *Last 5 minutes*.
    * Krijg je nergens de foutmelding *No Data*?
###### SNMP Interface Througput Dashboard
* [ ] Toets indien je nergens de foutmelding *No data* krijgt.
    * Selecteer het dashboard *SNMP Interface Throughput* (Links bovenaan, waar *Node Exporter Server Metrics*)
    * Kies de gewenste server bij *Host* (linksboven)
    * Verander de tijd (*rechtsboven*) van *Last 7 days* naar *Last 5 minutes*
    * Krijg je nergens de foutmelding *No Data*?
#### 6. Papa1 (PXEBoot-server)
###### Services
* [ ] Controleer op de PXEserver dat volgende services correct draaien:
    * [ ] nginx
    * Controleer met het command ``systemctl status nginx``
    * [ ] xinetd
    * Controleer met het command ``systemctl status xinetd``    
###### Mounts
* [ ] Verifiëer dat de ISO files correct gemount zijn.
    * Gebruik het commando ``cat /proc/mounts | grep /var/www/html `` om dit te controleren.
    * De uitvoer moet als volgt zijn:

        ``  /dev/loop0 /var/www/html/centos8 iso9660 ro,relatime 0 0
            /dev/loop1 /var/www/html/fedora iso9660 ro,relatime 0 0
        ``
###### Connectiviteit met nieuwe vm's
  * [ ] Werkstation moet booten met als eerste bootoptie "boot via network".
  * [ ] Het blauw scherm moet zichtbaar worden met opties voor CentOS8 en Fedora Workstation.
  * [ ] Bij het kiezen van de CentOS8 optie worden de installatie files gemount en begint de installatie van de OS. Dit gebeurd zonder foutmeldingen.
  * [ ] Bij het kiezen van de Fedora optie worden de correcte files gemount en begint de installatie van de OS. Dit gebeurd zonder foutmeldingen.
  * [ ] De hosts werd geboot zonder enige foutmeldingen.
  * [ ] Volgende zaken zijn aanwezig op de hosts.
      *  [ ]

&rarr; De hosts geboot & geïnstalleerd adhv de PXEboot server worden apart getest adhv test files. Deze bevinden zich buiten het algemeen testplan.
#### 7. Quebec1 (Forwarding DNS)
* [ ] Onderzoek of de FQDN(Fully Qualified Domain Name) is ingesteld op quebec1.green.local?
  * Gebruik het commando ```hostname``` om dit te controleren.

###### NSLookups Testen
* [ ] Controleer NSLookups van de servers overeenkomen met onderstaand tabel.
    * Gebruik ``` nslookup alfa1 ``` om de gegevens te verkrijgen.
      * Pas steeds de servergeving aan voor de juiste server.

| Naam       | VLAN    | IP-adres                         |
| :--------- | :------ | :------------------------------- |
| Alfa1      | VLAN 50 | 172.16.1.65                      |
| Bravo1     | VLAN 50 | 172.16.1.66                      |
| Charlie1   | VLAN 50 | 172.16.1.67                      |   
| Delta1     | VLAN 50 | 172.16.1.68                      |    
| Echo1      | VLAN 50 | 172.16.1.69                      |   
| Quebec1    | VLAN 50 | 172.16.1.70                      |  
| Kilo1      | VLAN 30 | 172.16.1.1                       |   
| Lima1      | VLAN 30 | 172.16.1.2                       |    
| Mike1      | VLAN 30 | 172.16.1.3                       |   
| November1  | VLAN 30 | 172.16.1.4                       |    
| Oscar1     | VLAN 30 | 172.16.1.5                       |    
| Papa1      | VLAN 30 | 172.16.1.6                       |
| www.hogent.be | / | ??? |

#### 8. November1 (MariaDB)
* [ ] Controleer of de MariaDB service gestart is bij de boot.
    * sudo systemctl status mariadb
* [ ] Verifeer of de MariaDB service 'Actief' is.
    * sudo systemctl status mariadb
* [ ] Toets of de databanken 'drupal_echo1' en 'drupal_mike1' bestaan.
    * mysql -uroot -p${mariadb_root_password} --execute 'show databases'*
    * mysql -uroot -p${mariadb_root_password} --execute 'show tables'*
* [ ] Onderzoek of gebruikers 'mike1_user' en 'echo1_user' schrijfrechten voor de aangewezen databanken.
    * mysql -u${mike1_user} -pmike1 \ --execute 'CREATE TABLE a (id int); DROP TABLE a;*
* [ ] Inspecteer dat MariaDB geen testdatabank en anonieme gebruikers meer heeft.
    * run mysql -uroot -p${mariadb_root_password} --execute 'show databases' test [ "0" -ne "${status}" ]*
    * sudo systemctl list-units --type service*
    * result=$(mysql -uroot -p${mariadb_root_password} --execute "select * from user where user='';" mysql) [ -z "${result}" ]
#### 9. Echo1 (Webserver)
###### Test toegangelijkheid
* [ ] Controleer indien www.green.local(of 172.16.1.69) in de browser een webpagina toont.
    * Opmerking: dns records voor www.green.local zijn vereist

###### Test https
* [ ] Controleer indien https actief is.
 *  Ga naar https://www.green.local
    * Expected: https werkt en u krijgt een webpagina te zien

* [ ] Controleer of je van **http://www.green.local** geredirect wordt naar **https://www.green.local**.
    * Expected: http://www.green.local wordt geredirect naar https://www.green.local
###### Test Drupal
--> vragen aan verantwoordelijke Mike. Karel

#### 10. Mike1 (Content management systeem)
? Zelfde als Echo1
#### 11. Lima1 (Interne file-server)
###### LDAP Client
* [ ] Controleer of we de server via localhost kunnen bereiken.
    * Gebruik command ```ldapsearch -x -LLL``` om een query naar alle entries op de server via localhost uit te voeren.
* [ ] Controleer met vorige commando om je onderstaande gebruikers en groepen terug  vindt.
   * [ ] Groepen:
        * IT_Administratie
        * Verkoop
        * Administratie
        * Ontwikkeling
        * Directie
   * [ ] Gebruikers:
        * Milan Dewilde
* [ ] Controleer indien de gebruiker 'milan' werd aangemaakt als systeemgebruiker.
  * Gebruik het commando ``getent passwd`` om dit te controleren.

#### 12. Delta1 (Mailserver)
* [ ] Het testscript moet voltooid zijn zonder foutmeldingen.
  * Gebruik ```bats /vagrant/test/delta1/delta1.bats``` om het script te runnen.


#### Opgesteld door Olivier Troch en Joeri Verhavert
