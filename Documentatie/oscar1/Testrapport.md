# Testrapport Oscar 1

> Voor het testen van deze server is het belangrijk dat bravo1 opstaat. Deze server is nodig voor het resolven van hostnames.

Breng de virtuele machine 'up' met het volgende commando: `vagrant up oscar1`.  
Bekijk de uitvoer van dit commando. Dit mag geen foutmeldingen geven.

- [x] Commando geeft geen foutmeldingen

## Testen Prometheus website

- **172.16.1.5:9090** -  *Prometheus*
  - [x] Website kan worden bekeken
  - Op deze website ga je naar *Status > Targets*.
  - Alle servers die draaien, moeten onder de hoofding *Prometheus* als **state** *up* hebben in de tabel.
    > Aangezien enkel bravo1 draait, heeft enkel deze de status *up*
    - [x] Dit is in orde
  - Alle routers, switches en firewalls die aanstaan, moeten onder de hoofding *SNMP* als **state** *up* hebben.
    - [ ] Dit is in orde

## Testen Grafana dashboards

- **172.16.1.5:3000** - *Grafana dashboard*
  - [x] Website kan worden bekeken
  - Log op deze website in met volgende gegevens:
    - **Gebruikersnaam**: admin
    - **Wachtwoord**: oscar1
    - [x] Op de website kan worden ingelogd

### Node Exporter Server Metrics Dashboard

> Op deze website ga je naar *Home (linksboven) > Node Exporter Server Metrics*.

- Selecteer de gewenste servers bij *Node* (linksboven)
- Verander de tijd (*rechtsboven*) van *Last 7 days* naar *Last 5 minutes*
- Krijg je nergens de foutmelding *No Data*? (Behalve bij Conntrack)
  - [x] In orde

## Node Exporter Full Dashboard

> Selecteer het dashboard *Node Exporter Full* (Links bovenaan, waar *Node Exporter Server Metrics*)

- Kies de gewenste server bij *Host* (linksboven)
- Verander de tijd (*rechtsboven*) van *Last 7 days* naar *Last 5 minutes*
- Krijg je nergens de foutmelding *No Data*?
  - [x] In orde

### SNMP Interface Througput Dashboard

> Selecteer het dashboard *SNMP Interface Throughput* (Links bovenaan, waar *Node Exporter Server Metrics*)

- Kies de gewenste server bij *Host* (linksboven)
- Verander de tijd (*rechtsboven*) van *Last 7 days* naar *Last 5 minutes*
- Krijg je nergens de foutmelding *No Data*?
  - [ ] In orde

> **Indien alles in orde**:
> - [ ] Testen geslaagd!
