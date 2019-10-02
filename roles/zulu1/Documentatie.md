# Documentatie  Zulu1
## PfSense configuratie en setup

### Manuele setup(Virtual box)
1. Download Pfsense iso file via [PfSense Website](https://www.pfsense.org/download/). 
2. Create Virtual Machine met type: BDS,versie:FREEBSD(64bit) en met opties TYPE: 

  2.1 Minstens 1024MB ram
  
  2.2 NAT NIC interface(WAN).
  
  2.3 intern netwerk met keuze naamgeving(LAN).
  
3. Store iso in Virtual Machine
4. Accepteer eerste pop-up venster.
5. Selecteer "Install". 
6. Kies een keymap(keylayout). 
7. Selecteer "Auto (UFS) : Guided Disk setup"
8. Wacht tot installatie voltooid, reboot system. 
9. Je wenst geen manuele modificatie uit te voeren, selecteer "No". 
10. Shutdown System. 
11. Verwijder iso file uit Virtual Machine
12. Start systeem terug op. 
11. Accepteer de Copyright notice. 
12. Kies voor "Set interface(s) IP Addresses"
    12.1 Kies een interface. 
    
    12.2 Stel in volgens ip addresserings tabel. 
    
    12.3 Stel subnet bit in volgens addresserings tabel.
    
    12.4 Geen DHCP. 
    
    12.5 Indien bij WAN, IPV4 upstream gateway address wordt default gateway van het netwerk. 
    
    12.6 Geen ipv6.
    
    12.7 geen reverting to HTTP. 
    
    
    
Opgemaakt door : Olivier Troch en Joeri Verhavert
