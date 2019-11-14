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
* [ ] Onderzoek of de FQDN(Fully Qualified Domain Name) is ingesteld op quebec1.green.local?
  * Gebruik het commando ```hostname``` om dit te controleren. 

##### NSLookups Testen
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
#### 10. Mike1 (Content management systeem)
##### Test toegangelijkheid
* [ ] Controleer indien www.green.local(of 172.16.1.69) in de browser een webpagina toont.
    * Opmerking: dns records voor www.green.local zijn vereist

##### Test https
* [ ] Controleer indien https actief is. 
 *  Ga naar https://www.green.local
    * Expected: https werkt en u krijgt een webpagina te zien

* [ ] Controleer of je van **http://www.green.local** geredirect wordt naar **https://www.green.local**.
    * Expected: http://www.green.local wordt geredirect naar https://www.green.local
##### Test Drupal
 --> vragen aan verantwoordelijke Mike. Karel 
#### 11. Lima1 (Interne file-server)
#### 12. Delta1 (Mailserver)
* [ ] Het testscript moet voltooid zijn zonder foutmeldingen. 
  * Gebruik ```bats /vagrant/test/delta1/delta1.bats``` om het script te runnen. 
   

#### Opgesteld door Olivier Troch en Joeri Verhavert
