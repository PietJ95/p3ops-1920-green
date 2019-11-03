# Draaiboek Linux 

Geschreven door: Thibault Dewitte
In samenwerking met: Bernard Deploige, Joeri Verhavert, Olivier Troch

Dit document is nog niet volledig afgewerkt, finale versie wordt 04/11 meegegeven.

## Ter info

Dit document is ter referentie voor onze eerste opstelling van de productie-omgeving.

### Tijdsschema

| Tijd | Wat? |
| :----------- | :----------- | 
| 09u00-09u15 | Meeting 1 | 
| 09u15-12u00 | Sessie 1 | 
| 12u00-12u30 | Middagpauze | 
| 12u30-12u45 | Meeting 2| 
| 12u45-16u00 | Sessie 2 | 
| 16u00-16u45 | Evaluatie | 
| 16u45-17u00 | Opruimen | 
| 17u00-17u15 | Meeting 3 | 


## Planning

**Prioriteitslijst**
1. Netwerk & server opstellen (R&S & Productie-omgeving)
2. Kilo1 (DHCP)
3. Alfa1 (Domeinserver)
4. Bravo1 & Charlie1 (DNS)
5. Quebec1 (Forwarding DNS)
6. November1 (MariaDB)
7. Echo1 (Webserver)
8. Mike1 (Content management systeem)
9. Lima1 (Interne file-server)
10. Delta1 (Mailserver)
11. Papa1 (PXEBoot-server)
12. Oscar1 (Monitoring-systeem)

Zulu1 (firewall) kan apart worden opgesteld doorheen de hele dag.

### Meeting 1

Er wordt van iedereen verwacht dat ze dit document hebben gelezen en weten wat hun individuele taken zijn. 
In deze meeting gaan we nog even vlug een korte planning overlopen en herinneren wie aan te spreken indien er problemen zijn.
Het tijdsschema wordt ook nog even overlopen maar iedereen zou dit al moeten kennen.
Het is ook belangrijk om te vermelden dat elke groep en in het algemeen wordt bijgehouden waar het fout loopt en hoe we dit kunnen vermijden in de toekomst.

### Sessie 1 

Eerst en vooral zal alles moeten worden opgesteld door de teams van Routers & Switching en de productie-omgeving: hiervoor wordt één uur voorzien.
Tijdens dit ene uur wordt er verwacht van de andere groepen dat ze hun testplan, testrapport en troubleshooting documentatie allemaal klaar hebben staan.
Eens het netwerk volledig is opgesteld zou aan de hand van `vagrant up` alles in de volgorde van de prioriteitslijst worden opgesteld.
Het is van cruciaal belang dat elke groep op voorhand alles heeft getest en voorbereid is op alle mogelijke situaties. 
Indien er fouten zijn moet elke groep klaarzitten om deze zo snel mogelijk op te lossen, zodat alles vlot kan verlopen.
Als er fouten voorkomen is het belangrijk dat deze genoteerd worden zodat we deze kunnen vermijden/oplossen voor de effectieve productiedag.

Vanaf een server up is wordt er verwacht dat de bijhorende groep hun testplan volgt en dit zo efficiënt mogelijk probeert te doen.
De testplannen kunnen apart worden uitgevoerd - zelfs als andere servers nog niet up and running zijn.
Vooraf wordt ook een algemeen testplan opgesteld door de groep van de productie-omgeving: eens alles up and running is kan dit worden uitgevoerd.

### Middagpauze

Gezamelijke middagpauze van 12u00 tot 12u30. We bestellen pizza voor iedereen van Domino's.
De bestellingslijst van pizza wordt via een google doc woensdag 13 november aangemaakt: iedereen kan dan zijn gewenste pizza, maat en kostprijs meegeven (indien er deals zijn zeker checken.)
Donderdagavond 14 november wordt deze lijst dan gefinaliseerd en zal er gevraagd worden op Trello om uw kost van de pizza dan over te schrijven naar een gezamelijke rekening. 
Er wordt verwacht dat dit van iedereen gebeurt vóór zondag zodat we de maandag kunnen bestellen. 
Als iemand niet gestort heeft dan zullen we de pizza van deze persoon niet bestellen.


### Meeting 2

In deze meeting zullen we kort bespreken waar het fout loopt en hoe we dit kunnen oplossen tijdens sessie 2.
We vermelden ook dat groepen waarbij alles goed verloopt hun testrapporten verder afwerken tijdens sessie 2.

### Sessie 2

In deze sessie wordt verwacht dat de problemen die zich voordeden in sessie 1 worden opgelost.
Testrapporten moeten volledig opgesteld zijn voor alle groepen.
Het is hier opnieuw van belang dat alles voldoende gedocumenteerd is zodat we tijdens de finale productiedag op alle scenario's voorbereid zijn.
Het laatste uur checkt het productieteam opnieuw of alles in orde is om geëvalueerd te worden.

### Evaluatie

De docenten volgen ons globaal testplan en geven hierop feedback.
Deze feedback staat niet op punten maar is toch wel heel belangrijk ivm de actuele productie-release in week 13.

### Opruimen

Eens de evaluatie is afgerond wordt alles netjes opgeruimd: al het gebruikt materiaal wordt gereset en de desbetreffende kabels worden opgebergd.

### Meeting 3
Korte meeting om nog eens te reïtereren hoe alles verlopen is. 
Alle groepen kort overlopen hoe het gegaan is.

## Concreet

| Groep | Beschrijving taak | Geschatte duur | Start uur | Maximaal eind uur      |
| :----------- | :----------- | :------------ | :--- | :-------------- | 
| Iedereen | Stand-up 1 | 15 min | 09:00 | 09:15 |
| Iedereen | Klaarstellen machines | 30 - 45 min | 09:00 | 09:45 - 10:00 |
| R&S | Opstellen netwerk | 30 - 45 min | 09:15 | 09:45 - 10:00 |
| Kilo1 | Installeren machine | 15 min | 10:00 - 10:15 | 10:15 - 10:30 |
| Bravo1 | Installeren machine | 15 min | 10:15 - 10:30 | 10:30 - 10:45 |
| Quebec1 | Installeren machine | 15 min | 10:30 - 10:45 | 10:45 - 11:00 |
| November1 | Installeren machine | 15 min | 10:45 - 11:00 | 11:00 - 11:15 |
| Echo1 | Installeren machine | 15 min | 11:15 - 11:30 | 11:30 - 11:45 |
| Mike1 | Installeren machine | 15 min | 11:30 - 11:45 | 11:45 - 12:00 |
| Lima1 | Installeren machine | 15 min | 11:45 - 12:00 | 12:00 - 12:15 |
| Iedereen | Lunch pauze | 30 min | 12:00 - 12:15 | 12:30 - 12:45 |
| Iedereen | Stand-up 2 | 15 min | 12:30 - 12:45 | 12:45 - 13:00 |
| Delta1 | Installeren machine | 15 min | 13:00 - 13:15 | 13:15 - 13:30 |
| Papa1 | Installeren machine | 15 min | 13:15 - 13:30 | 13:30 - 13:45 |
| Oscar1 | Installeren machine | 15 min | 13:45 - 14:00 | 14:00 - 14:15 |
| Zulu | Installeren machine | 15 min | 14:00 - 14:15 | 14:15 - 14:30 |
| Iedereen | Evaluatie | 45 min | 16:00 | 16:45 |
| Iedereen | Opruimen | 15 min | 17:00 | 17:15 |

Eens de machines op de server staan moeten de testplannen doorlopen worden door de verantwoordelijke groepen. 