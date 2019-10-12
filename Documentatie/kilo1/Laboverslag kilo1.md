

# Documentatie Kilo1 (DHCP-server)

- Student name: Lincy De Groote en Yordi 
- Leren werken met:
  - DHCP servers
  - pools
  - statische IP-adressen
  - statische MAC-adressen
  - subnetting
  - vagrant
  - ansible
  - git

## Cheat sheet



## Procedure/Documentation (af)

- UITLEG ROLLEN TOEVOEGEN

- Ga naar het document *`servers.yml`* in de map Ansible

  Voeg dit toe aan het document

  - ```
    - name: kilo1
      become: true
      roles:
        - kilo1-dhcp	
    ```

- Ga naar het bestand *`kilo1.yml`* in de map host_vars

  - Voeg dit toe aan het document om de DHCP toe te laten in de firewall

    - ```
      rhbase_firewall_allow_services:
        - dhcp
      ```

  - Voeg dit toe  aan het document om de DNS servers toe te voegen aan je DHCP-systeem

    - ```
      dhcp_global_domain_name_servers:
        - 172.16.1.66
        - 172.16.1.67
      ```

  - Voeg een lease time toe (om de zoveel tijd een nieuw IP geven)

    - ```
      dhcp_global_default_lease_time: 43200
      dhcp_global_max_lease_time: 43200
      ```

  - Voeg een global domain name toe

    - ```
      dhcp_global_domain_name: green.local
      ```

  - Maak subnetten aan per VLAN

    - ```
      dhcp_subnets:
          # VLAN 20
        - ip: 172.16.0.0
          netmask: 255.255.255.0
          routers: 172.16.0.1
          pools:
            - range_begin: 172.16.0.2
              range_end: 172.16.0.254

          # VLAN 30
        - ip: 172.16.1.0
          netmask: 255.255.255.192
          routers: 172.16.0.1
          pools:
            - range_begin: 172.16.1.1
              range_end: 172.16.1.62

          # VLAN 40
        - ip: 172.16.1.96
          netmask: 255.255.255.252
          routers: 172.16.0.1
          pools:
            - range_begin: 172.16.1.97
              range_end: 172.16.1.98

          # VLAN 50
        - ip: 172.16.1.64
          netmask: 255.255.255.224
          routers: 172.16.0.1
          pools:
            - range_begin: 172.16.1.65
              range_end: 172.16.1.94

          # VLAN 60
        - ip: 172.16.1.100
          netmask: 255.255.255.252
          routers: 172.16.0.1
          pools:
            - range_begin: 172.16.1.101
              range_end: 172.16.1.102
              
          # VLAN 70
        - ip: 172.16.1.104
          netmask: 255.255.255.252
          routers: 172.16.0.1
          pools:
            - range_begin: 172.16.1.105
              range_end: 172.16.1.106
      ```

  - Geef elke host met een statisch IP een statische MAC adres mee en IP-adres

    - ```
      # Statisch IP via MAC
      dhcp_hosts:
        - name: Alfa1
          mac: '08:00:27:66:5D:01'
          ip: 172.16.1.65
        - name: Bravo1
          mac: '08:00:27:66:5D:02'
          ip: 172.16.16.66
        - name: Charlie1
          mac: '08:00:27:66:5D:03'
          ip: 172.16.1.67
        - name: Delta1
          mac: '08:00:27:66:5D:04'
          ip: 172.16.1.68
        - name: Echo1
          mac: '08:00:27:66:5D:05'
          ip: 172.16.1.69
        - name: Lima1
          mac: '08:00:27:66:5D:06'
          ip: 172.16.1.2
        - name: Mike1
          mac: '08:00:27:66:5D:07'
          ip: 172.16.1.3
        - name: November1
          mac: '08:00:27:66:5D:08'
          ip: 172.16.1.4
        - name: Oscar1
          mac: '08:00:27:66:5D:09'
          ip: 172.16.1.5
        - name: Papa1
          mac: '08:00:27:66:5D:0A'
          ip: 172.16.1.6
        - name: Zulu1
          mac: '08:00:27:66:5D:0B'
          ip: 172.16.1.106
        - name: Router0
          mac: '08:00:27:66:5D:0C'
          ip: 172.16.1.105
        - name: Switch1
          mac: '08:00:27:66:5D:0D'
          ip: 172.16.1.97
        - name: Switch2
          mac: '08:00:27:66:5D:0E'
          ip: 172.16.1.98
        - name: Management
          mac: '08:00:27:66:5D:0F'
          ip: 172.16.99.1   
      ```


## To Do

- [x] correcte ansible role vinden
- [x] ansible rol toevoegen
- [x] bestand aanmaken kilo.yml in juiste map (host_vars)
- [x] bestand kilo.yml configureren
  - [x] firewall
  - [x] DNS domainen toevoegen
  - [x] lease time
  - [x] global domain name
  - [ ] subnets (per VLAN?)
  - [ ] statische IP via MAC
- [ ] controle (testplan)
  - [ ] controle VLAN
    - [ ] controleer per VLAN of het IP-adres uit de juiste range komt
  - [ ] controle statische IP via MAC
    - [ ] controleer per server of het IP-adres correct is
- [ ] Documentatie
  - [ ] Inleiding
    - [x] wat leren we
    - [ ] cheatsheet
  - [x] stappenplan
  - [ ] extra uitleg bij stappenplan
  - [ ] testplan
  - [x] TO DO
  - [ ] resources
- [ ] EXTRA
  - [ ] trello borden/ kaarten 
  - [ ] logboek
  - [ ] tijdregistratie

## Resources

https://en.wikipedia.org/wiki/Private_network

https://galaxy.ansible.com/bertvv/dhcp

https://www.if-not-true-then-false.com/2018/fedora-28-workstation-install-guide/

https://docs.fedoraproject.org/en-US/Fedora/25/pdf/Networking_Guide/Fedora-25-Networking_Guide-en-US.pdf

https://support.rackspace.com/how-to/changing-dns-settings-on-linux/

https://www.cyberciti.biz/faq/linux-unix-find-out-dns-server-ip-address-names/172