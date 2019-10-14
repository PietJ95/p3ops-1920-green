## Test plan 

- Maak een VM aan in VirtualBox met 2 netwerk adapters 
  - 1 host-only via DHCP
  - 1 host-only via gegeven IP-adres
  - Zorg dat van 1 adapter het mac-adres gelijk is aan die in de DHCP configuratie
- Boot de machine met een gekozen isofile
  - Hier FedoraWorkstation
- Controleer dat:
  - De interfaces de juiste IP-adressen hebben
    - 1 moet 172.16.128.10
    - 1 moet een adres hebben uit de pool
  - De VM moet kunnen gaan naar de website 'http://www.avalon.lan'
- Alle boxen destoryen en een volledige vagrant up doen
  - Alle testen moeten slagen
  - Services zoals FTP, SMB, DHCP, DNS en Webserver moet zichtbaar zijn in de aangemaakte VM
- Op de VM kunnen inloggen als verschillende personen in de FTP en SMB-server







Controle IP-instellingen

- Eerste adapter komt uit pool 1 (lukt niet)
  - [ ] IP = 172.16.128.10
  - [x] MAC = 08:00:27:8B:17:76
  - [ ] komt uit eerste pool
- Tweede adapter komt uit pool 2 (lukt)
  - [x] Komt uit tweede pool
- Controle DNS instellingen zoals bij adapter 1 als 2
  - [ ] IP DNS = 192.0.2.10 en 192.0.2.11
- Controle default gateway
  - [x] Default gateway = 172.16.255.254