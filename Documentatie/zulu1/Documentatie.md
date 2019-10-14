# Documentatie  Zulu1
## PfSense configuratie en setup

### Manuele setup(Virtual box)

1. Download Pfsense iso file via [PfSense Website](https://www.pfsense.org/download/). 

2. Create Virtual Machine met type: BDS,versie:FREEBSD(64bit) en met opties TYPE:
    >* Minstens 1024MB ram.
    >* NAT NIC interface(WAN).
    >* intern netwerk met keuze naamgeving(LAN).
3. Store iso in Virtual Machine.
4. Accepteer eerste pop-up venster.
5. Selecteer "Install". 
6. Kies een keymap(keylayout). 
7. Selecteer "Auto (UFS) : Guided Disk setup".
8. Wacht tot installatie voltooid, reboot system. 
9. Je wenst geen manuele modificatie uit te voeren, selecteer "No". 
10. Shutdown System. 
11. Verwijder iso file uit Virtual Machine.
12. Start systeem terug op. 
11. Accepteer de Copyright notice. 
12. Kies voor "Set interface(s) IP Addresses".

    >* Kies een interface. 
    >* Stel in volgens ip addresserings tabel. 
    >* Stel subnet bit in volgens addresserings tabel.
    >* Geen DHCP. 
    >* Indien bij WAN, IPV4 upstream gateway address wordt default gateway van het netwerk.
    >* Geen ipv6.
    >* geen reverting to HTTP. 

### Webinterface access

 1. Surf naar het ipadres van de LAN interface. 
 2. Login in met gepaste credentials.
    >* Username : admin
    >* Password : pfsense

![Image login webinterface](https://github.com/HoGentTIN/p3ops-1920-green/tree/master/Documentatie/zulu1/Images/WebinterfaceLoginPfsense.PNG)

### Configuratie
#### Admin account + account toevoegen

1. Verander het wachtwoord van de pfsense admin account. 
    >*

#### Monitoring service : SNMP Daemon

1. Enable het SNMP Daemon service voor monitoring. 
 >* Kies services in menu balk. 
 >* Kies vervolgens voor SNMP in de dropdown menu. 
 >* Enable de service
    >*Zorg ervoor dat de polling port op 161 staat. 
    >*Zorg ervoor dat alle SNMP Module boxes aangeduid zijn. 
    >*Selecteer de interface waar je de SNMP-deamon wilt binden. Doorgaans is dit de LAN-interface in uwe pfsense. 

#### Firewall Alias

    
Opgemaakt door: Olivier Troch en Joeri Verhavert
    
Opgemaakt door: Olivier Troch en Joeri Verhavert
