# Troubleshoot rapport
## Productie release 18 november
### Inleiding
Tijdens het deployen van de server, werden twee bridged adapters gecreëerd. Het creëren van deze adapter, zorgt ervoor dat deze gezien worden als virtuele switched.
Er werden twee bridged adapter voorzien, één voor vlan 30 en één voor vlan 50.


#### Probleem 1
Wanneer men de virtuele machine opstart ondervinden we geen problemen, het probleem begint wanneer we een van de adapters op de virutele machine proberen te veranderen naar een bridged adapter. Deze zou moeten linken aan de aangemaakte bridged adapters op de server zelf. Door de adapter op de virtuele machine te veranderen naar bridged, moet het mogelijk zijn om van binnen in het netwerk een secure shell verbinden te leggen. Maar dit lukt niet.

#### Probleem 2
Bij het creëren van de virtuele machine zorgt vagrant voor een extra adapter op de server en initialiseert deze met een IP. De illusie van die probleem, is dat wannneer je pingt naar het IP adres van de virtuele machine. Dan merk je dat deze ping slaagt omdat hij het IP pingt van de adapter op de server zelf en niet de virtuele machine zelf.

#### Stand van zaken
Vandaag, 18 November 2019 zijn we geëindigd met de adapters op bridged te zetten op de server. Wij zijn erin geslaagd op vanuit een machine uit het netwerk een secure shell verbinding te maken met een virtuele machine. Dit gebeurde simultaan wanneer een andere team de productie op laptops uitvoer. Natuurlijk werd er rekening gehouden met duplicaten IP adressen.

Vandaag, 25 november zijn we niet veel opgeschoven. Door de retrospectieve en het lange opstart van het netwerk zijn we niet veel verder geraakt als vorige week.

Vandaag, 2 december 2019 zijn we geëindigd waar we vorige week zaten. Problemen met het netwerk hebben 3u30 geduurd. Wanneer we kilo1 opstarten ondervonden we terug problemen met de bridging. Dit zal volgende week verder getest moeten worden.

Vandaag, 9 december 2019 zijn we geëindigd met de adapters terug te zetten naar gewone internet adapter. Woensdag zal nogmaals getest worden indien we een van de adapter kunnen aanpassen naar bridged. Dit zal dus geen linking zijn naar de bridged adapter op de server zelf. Daarnaast werd de vagrant file op de server ook aangepast, bij het creëren van een virtuele machine zal deze automachine aan de juiste aan de juiste bridged adapter. Maar aangezien we die woensdag proberen testen zonder bridged adapters op de server, weten we niet of dit zal werken.

### Conclussie
Het opstarten van virtuele machines op de server is geen probleem, connectie van de verschillende eilanden naar de virtuele machine binnen het netwerk is niet mogelijk. Dit is dankzij de bridging poorten.


#### Opgesteld door Joeri Verhavert
