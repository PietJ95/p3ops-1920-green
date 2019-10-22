## Test plan 

### Check-list

Alfa 1

- [ ] mac: '08:00:27:66:5D:01'
- [ ] ip: 172.16.1.65
- [ ] komt uit subnet VLAN 50 
- [ ] Default Gateway: 172.16.1.94

Bravo1

- [ ] mac: '08:00:27:66:5D:02'
- [ ] ip: 172.16.16.66
- [ ] komt uit subnet VLAN 50
- [ ] Default Gateway: 172.16.1.94

Charlie1

- [ ] mac: '08:00:27:66:5D:03'
- [ ] ip: 172.16.1.67
- [ ] Komt uit subnet VLAN 50
- [ ] Default Gateway: 172.16.1.94

Delta1

- [ ] mac: '08:00:27:66:5D:04'
- [ ] ip: 172.16.1.68
- [ ] Komt uit subnet VLAN 50
- [ ] Default Gateway: 172.16.1.94

Echo1

- [ ] mac: '08:00:27:66:5D:05'
- [ ] ip: 172.16.1.69
- [ ] Komt uit subnet VLAN 50
- [ ] Default Gateway: 172.16.1.94

Kilo1

- [ ] ip: 172.16.1.1
- [ ] Komt uit subnet VLAN 30
- [ ] Default Gateway: 172.16.1.62

Lima1

- [ ] mac: '08:00:27:66:5D:06'
- [ ]  ip: 172.16.1.2
- [ ] komt uit subnet VLAN 30
- [ ] Default Gateway: 172.16.1.62

Mike1

- [ ] mac: '08:00:27:66:5D:07'
- [ ]  ip: 172.16.1.3
- [ ] komt uit subnet VLAN 30
- [ ] Default Gateway: 172.16.1.62

November1

- [ ]  mac: '08:00:27:66:5D:08'
- [ ]  ip: 172.16.1.4
- [ ] komt uit subnet VLAN 30
- [ ] Default Gateway: 172.16.1.62

Oscar1

- [ ]  mac: '08:00:27:66:5D:09'
- [ ] ip: 172.16.1.5
- [ ] komt uit subnet VLAN 30
- [ ] Default Gateway: 172.16.1.62

Papa1

- [ ] mac: '08:00:27:66:5D:0A'
- [ ] ip: 172.16.1.6
- [ ] komt uit subnet VLAN 30
- [ ] Default Gateway: 172.16.1.62

Quebec1

- [ ] Komt uit subnet VLAN 50
- [ ] Default Gateway: 172.16.1.94

Zulu1

- [ ]  mac: '08:00:27:66:5D:0B'
- [ ]  ip: 172.16.1.106
- [ ] komt uit subnet VLAN 70

Clients

- [ ] komt uit subnet VLAN 20
- [ ] Default Gateway: 172.16.0.254

Router0

- [ ]    mac: '08:00:27:66:5D:0C'
- [ ] ip: 172.16.1.105
- [ ] komt uit subnet VLAN 70

Switch1

- [ ] mac: '08:00:27:66:5D:0D'
- [ ] ip: 172.16.1.97
- [ ] komt uit subnet VLAN 40

Switch2

- [ ] mac: '08:00:27:66:5D:0E'
- [ ] ip: 172.16.1.98
- [ ] komt uit subnet VLAN 40

### Stappenplan testen reservaties offline

#### Opzetten Virtueel test netwerk

- Maak een eigen virtueel netwerk aan met ansible

- maak een map Test_DHCP_Project, in die map voeg je 

  - de 'vagrantfile' toe

  - het bestand 'vagrant-hosts'

    - ```
      -name: dhcpTest
        ip: 172.16.1.7 # veranderd omdat ansible moeilijk doet over 1.1
      - name: Alfa1
        mac: '08:00:27:66:5D:01'
      - name: Bravo1
        mac: '08:00:27:66:5D:02'
      - name: Charlie1
        mac: '08:00:27:66:5D:03'
      - name: Delta1
        mac: '08:00:27:66:5D:04'
      - name: Echo1
        mac: '08:00:27:66:5D:05'
      - name: Lima1
        mac: '08:00:27:66:5D:06'
      - name: Mike1
        mac: '08:00:27:66:5D:07'
      - name: November1
        mac: '08:00:27:66:5D:08'
      - name: Oscar1
        mac: '08:00:27:66:5D:09'
      - name: Papa1
        mac: '08:00:27:66:5D:0A'
      - name: Zulu1
        mac: '08:00:27:66:5D:0B'
      - name: Router0
        mac: '08:00:27:66:5D:0C'
      - name: Switch1
        mac: '08:00:27:66:5D:0D'
      - name: Switch2
        mac: '08:00:27:66:5D:0E'
      - name: Management
        mac: '08:00:27:66:5D:0F'  
      ```

  - de map 'ansible'

- In de map 'ansible' maak je volgende structuur aan

  - dir: group_vars

    - file: all.yml

      - ```
        rhbase_repositories:
          - epel-release
          #Install the following packagees on all servers.
        rhbase_install_packages:
          - bash-completion
          - bind-utils
          - git
          - nano
          - tree
          - vim-enhanced
          - wget

        rhbase_users:
          - name: lincy
            comment: 'Administrator'
            password: lincy
            groups:
              - wheel

          #SSH USER.
        rhbase_ssh_user: lincy

          #SSH key pair generated and public key added to every server so you don't have to use a password.
        rhbase_ssh_key: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOQiB9rU+Fll0CIW59/GTNECixSmqxvOyP8dnFQ/TL6xnYwioRHRl/roM1ezXJ23mqATByIhE4P0ZIY2tDfFU/AMeYBTgev7ULPgVl9uovPRsk49rOcU+gUr6g58WXAcUxl54I337dgy3sC0J0X9s1+nJxEjeoxcsrb5ZNRWGyQB9hR8ST9oiof1KHZGDNparjBWaJTXE+CGMPNC4ARfJIflJbQCkp4KGHb32a3Rj4GDWrWAqyKPViZAvI2SzkQzaX4gqTEe99BHdBhrR7Ob+LhsCr6FdlotTOCzKbY5ViLJCskNYC7ryoI9tNKiIF9IjvwVkZiM3EV3L+IBw4M84j nicol@ASUSS510'

          #Enable message of the day to show network connection information.
        rhbase_motd: true
        ```

  - dir: host_vars

    - dhcpTest.yml

      - ```
        # kilo1
        ---

        rhbase_firewall_allow_services:
          - dhcp
        #dns master and slave
        dhcp_global_domain_name_servers:
          - 172.16.1.66
          - 172.16.1.67

        #12u
        dhcp_global_default_lease_time: 43200
        dhcp_global_max_lease_time: 43200
        #domain
        dhcp_global_domain_name: green.local
        #pxeboot
        dhcp_global_next_server: 172.16.1.6 

        dhcp_subnets:
            # VLAN 20 clients voor gebruik DHCP
          - ip: 172.16.0.0
            netmask: 255.255.255.0
            routers: 172.16.0.254
            pools:
              - range_begin: 172.16.0.1
                range_end: 172.16.0.253

            # VLAN 30 voor reservaties statische IP's
          - ip: 172.16.1.0
            netmask: 255.255.255.192
            routers: 172.16.1.62
            pools:
              - range_begin: 172.16.1.1
                range_end: 172.16.1.62

            # VLAN 40 voor reservaties statische IP's
          - ip: 172.16.1.96
            netmask: 255.255.255.252
            pools:
              - range_begin: 172.16.1.97
                range_end: 172.16.1.98

            # VLAN 50 voor reservaties statische IP's
          - ip: 172.16.1.64
            netmask: 255.255.255.224
            routers: 172.16.1.94
            pools:
              - range_begin: 172.16.1.65
                range_end: 172.16.1.94

            # VLAN 60 voor reservaties statische IP's
          - ip: 172.16.1.100
            netmask: 255.255.255.252
            pools:
              - range_begin: 172.16.1.101
                range_end: 172.16.1.102
                
            # VLAN 70 voor reservaties statische IP's
          - ip: 172.16.1.104
            netmask: 255.255.255.252
            pools:
              - range_begin: 172.16.1.105
                range_end: 172.16.1.106

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
            # Zulu1 tweede interface???
            # Zulu1 statisch, niet via DHCP?
         #- name: Zulu1
         #  mac: ''
         #  ip: 172.16.1.102
          - name: Router0
            mac: '08:00:27:66:5D:0C'
            ip: 172.16.1.105
          - name: Switch1
            mac: '08:00:27:66:5D:0D'
            ip: 172.16.1.97
          - name: Switch2
            mac: '08:00:27:66:5D:0E'
            ip: 172.16.1.98
            # waarom 2 interface??
         # - name: Switch2
          #  mac: ''
           # ip: 172.16.1.101
        #  - name: Management
         #   mac: '08:00:27:66:5D:0F'
          #  ip: 172.16.99.1   
        ```

  - dir: roles

    - voeg de rol 'bertvv.dhcp' toe
    - Voeg de rol 'bertvv.rhbase' toe

  - file: site.yml

    - ```
      - hosts: dhcpTest
        become: true                
        roles:
          - bertvv.rh-base
          - bertvv.dhcp
      ```

#### Testen virtueel netwerk

- Ga naar de map Test_dhcp-project

  - rechter muisknop 'Git bash here'

- start de DHCP server op

  - ```
    vagrant up dhcpTest
    ```

- start Alfa1 op

  - ```
    vagrant up Alfa1
    ```

- ​

**<u>RESULTAAT BRAVO1</u>**

user@LAPTOP-98267RUL MINGW64 ~/Documents/GitHub/backup_elnx-1819-sme-LincyDeGroote_versie (solution)                                                                        

$ vagrant ssh Bravo1                                                                                                                                                        
[vagrant@Bravo1 ~]$ ifconfig                                                                                                                                                
eth0: flags=4163  mtu 1500                                                                                                                  
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255                                                                                                         
        inet6 fe80::8656:abd1:2f02:d3f3  prefixlen 64  scopeid 0x20                                                                                                   
        ether 08:00:27:8b:c9:3f  txqueuelen 1000  (Ethernet)                                                                                                                
        RX packets 35855  bytes 39198961 (37.3 MiB)                                                                                                                         
        RX errors 0  dropped 0  overruns 0  frame 0                                                                                                                         
        TX packets 8719  bytes 1035066 (1010.8 KiB)                                                                                                                         
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0                                                                                                          
                                                                                                                                                                            
eth1: flags=4163  mtu 1500                                                                                                                  
        **inet 172.16.16.66  netmask 255.255.255.0  broadcast 172.16.16.255**                                                                                                   
        inet6 fe80::a00:27ff:fe66:5d02  prefixlen 64  scopeid 0x20                                                                                                    
        **ether 08:00:27:66:5d:02  txqueuelen 1000  (Ethernet)**                                                                                                                
        RX packets 57  bytes 5043 (4.9 KiB)                                                                                                                                 
        RX errors 0  dropped 0  overruns 0  frame 0                                                                                                                         
        TX packets 18  bytes 2212 (2.1 KiB)                                                                                                                                 
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0                                                                                                          
        device interrupt 16  base 0xd240                                                                                                                                    
                                                                                                                                                                            
lo: flags=73  mtu 65536                                                                                                                                
        inet 127.0.0.1  netmask 255.0.0.0                                                                                                                                   
        inet6 ::1  prefixlen 128  scopeid 0x10                                                                                                                        
        loop  txqueuelen 1000  (Local Loopback)                                                                                                                             
        RX packets 4  bytes 328 (328.0 B)                                                                                                                                   
        RX errors 0  dropped 0  overruns 0  frame 0                                                                                                                         
        TX packets 4  bytes 328 (328.0 B)                                                                                                                                   
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0                                                                                                          
                                                                                                                                                                            ****<u></u>
**<u>RESULTAAT Charlie1</u>**

  $ vagrant ssh Charlie1                                                                                                                                                      

[vagrant@Charlie1 ~]$ ifconfig                                                                                                                                              
eth0: flags=4163  mtu 1500                                                                                                                  
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255                                                                                                         
        inet6 fe80::b480:f48e:a705:b291  prefixlen 64  scopeid 0x20                                                                                                   
        ether 08:00:27:8b:c9:3f  txqueuelen 1000  (Ethernet)                                                                                                                
        RX packets 34541  bytes 39030539 (37.2 MiB)                                                                                                                         
        RX errors 0  dropped 0  overruns 0  frame 0                                                                                                                         
        TX packets 7745  bytes 884792 (864.0 KiB)                                                                                                                           
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0                                                                                                          
                                                                                                                                                                            
eth1: flags=4163  mtu 1500                                                                                                                  
        **inet 172.16.1.67  netmask 255.255.255.0  broadcast 172.16.1.255**                                                                                                     
        inet6 fe80::a00:27ff:fe66:5d03  prefixlen 64  scopeid 0x20                                                                                                    
        **ether 08:00:27:66:5d:03  txqueuelen 1000  (Ethernet)**                                                                                                                
        RX packets 21  bytes 1932 (1.8 KiB)                                                                                                                                 
        RX errors 0  dropped 0  overruns 0  frame 0                                                                                                                         
        TX packets 18  bytes 2212 (2.1 KiB)                                                                                                                                 
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0                                                                                                          
        device interrupt 16  base 0xd240                                                                                                                                    
                                                                                                                                                                            
lo: flags=73  mtu 65536                                                                                                                                
        inet 127.0.0.1  netmask 255.0.0.0                                                                                                                                   
        inet6 ::1  prefixlen 128  scopeid 0x10                                                                                                                        
        loop  txqueuelen 1000  (Local Loopback)                                                                                                                             
        RX packets 4  bytes 328 (328.0 B)                                                                                                                                   
        RX errors 0  dropped 0  overruns 0  frame 0                                                                                                                         
        TX packets 4  bytes 328 (328.0 B)                                                                                                                                   
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0                                                                                                          



**WORKSTATION AANMAKEN** 

**-> DEZE WORKSTATION 2 ADAPTERS GEVEN**

**​	-> 1 statisch**

**​	-> 1 DHCP in de juiste range**

**-> controle op workstation via ifconfig**



##  References

<https://www.tecmint.com/find-my-dns-server-ip-address-in-linux/>

 

  