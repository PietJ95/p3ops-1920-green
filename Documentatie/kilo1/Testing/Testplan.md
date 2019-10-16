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





TEST LINCY

kilo1-DHCP toevoegen in mijn eigen linux netwerk

in de file vagrant-host een nieuwe host toevoegen kilo1-dhcp met ip en mac adres (alle andere servers ook toevoegen maar geen host-file voor aanmaken)

de host-file van het project gebruiken 

vagrant up kilo1-dhcp

vagrant up {NAAM} -> bijvoorbeeld vagrant up bravo1

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

WORKSTATION AANMAKEN 

-> DEZE WORKSTATION 2 ADAPTERS GEVEN

​	-> 1 statisch

​	-> 1 DHCP in de juiste range

-> controle op workstation via ifconfig

  

  