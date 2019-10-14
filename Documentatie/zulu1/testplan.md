#Testplan setup en configuratie Zulu1 
## Setup 

## Configuratie
1. Op het hostsysteem, ga naar de locale directory van het project repo. 
2. Voer het commando `vagrant up Zulu1` uit. 
3. Eens machine up to running is controleer volgende interfaces:
  * WAN : 192.168.1.106/30
  * LAN: 192.168.1.102/29

Om het testplan verder uit te werken, moet je verbinden met het intern netwerk. Voor meer informatie over hoe je dit moet doen, vind je in de documentatie.

4. Controleer of de hostname Zulu1 is.
5. Zulu1 moet zich bevinden in het domain green.local. 
6. Vervolgens mag het admin account het default wachtwoord niet meer bevatten. 
7. Check of het systeem up to date is, dit zou het geval moeten zijn. 

8. Als volgende stap controleer je of de SNMP Daemon service enabled is. 
9. Daarna check je of er 3 Firewall aliases zijn aangemaakt, genaamd: 
    * HTTPandHTTPS, met volgende settings:
        >* Type: Port(s)
        >* Port: 80 (HTTP)
        >* Port: 443 (HTTP/S)
    * IMAPandIMAPS
        >* Type: Port(s)
        >* Port: 143 (IMAP)
        >* Port: 993 (IMAP/S)
    * POandPOPS
       >* Type: Port(s)
       >* Port: 110 (POP3)
       >* Port: 995 (POP/S)
 10. Er moeten natuurlijk ook bepaalde rules aanwezig zijn voor de firewall. 
    10.1 Voor WAN zou je volgende rules moeten hebben: 
      * Rule 1: webserver(Echo1).
        >* Action: Pass
        >* Interface: WAN
        >* Address Family: IPV4
        >* Protocol: TCP
        >* Source: ANY
        >* Destination: Single host or alias (172.16.1.69)
        >* Destination Port Range: 
            >* other - custom (HTTP_HTTPS)
     * Rule 2: mailserver SMTP.

        >* Action: Pass
        >* Interface: WAN
        >* Source: ANY
        >* Destination: Single host or alias (172.16.1.68)
        >* Destination Port Range
            >* SMTP(465) to SMTP(465)

    * Rule 3: mailserver IMAP.

        >* Action: Pass
        >* Interface: WAN
        >* Source: ANY
        >* Destination: Single host or alias (172.16.1.68)
        >* Destination Port Range: 
           > * other - custom (IMAP_IMAPS)

   * Rule 4: mailserver POP.
        >* Action: Pass
        >* Interface: WAN
        >* Source: ANY
        >* Destination: Single host or alias (172.16.1.68)
        >* Destination Port Range: 
            >* other - custom (POP3_POP/S)
            
   10.2 Voor LAN zouden de standaard rules moeten volstaan, deze zouden aanwezig moeten zijn. 
 11. Op firewall Zulu1, zou DHCP relay enabled moeten zijn. Dit zou het ip moeten bevatte van de dhcp server. 
 12. DHCP server service is disabled. 
 13. Vervolgens staat ipv6 ook gedisabled, samen met de DNS Resolver. 
