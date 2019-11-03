# CentOS kickstart file

## 1. Wat er allemaal mis ging

Het is aangeraden om eerst een fysieke install te doen en van daaruit de anaconda kickstart file te halen.
installs van de minimale CentOS 8 faalde telkens opnieuw (heel wat verschillende virtualbox instelling geprobeerd + zowel op ubuntu systeem als windows systeem) en ik kreeg telkens een zeer kleurrijk scherm als resultaat. CentOS 8 heeft ook nog geen aparte minimale install, enkel de 8gb iso met als optie tijdens installatie de minimale versie. Hierdoor ben ik uiteindelijk toch overgeschakeld naar CentOS 7.

Vervolgens probeerde ik via een gui programma een geavanceerder kickstart file te maken. 

	sudo apt-get install system-config-kickstart
	system-config-kickstart
Dit moet uitgevoerd worden op de os in kwestie. Doordat ik dit runde op mijn ubuntu machine, gaf dit syntax voor een ubuntu kickstart file. En kon ik enkel een Ubuntu optie aanklikken.

## 2. Installeer centos en neem de anaconda-ks.cfg

Na installatie van centos op een fysieke laptop , nam ik de anaconda-ks.cfg over via ssh.

Opmerking: ingloggegevens: root : "papacentos"

Deze sloeg ik op als "centos_base.cfg" en ik paste 2 lijnen aan:
We willen geen grafische installatie, dus veranderen "graphical" naar "text". En netwerk installation omdat onze pxe-server via http werkt.

	# use network installation
	url --url="http://172.16.1.6:8188/centos8"
	# changed graphical to text
	text

## Testen en aanpassen centos8.cfg

Verplaats en hernoem de kickstarter file: roles/papa1-pxeserver/templates/centos8.cfg

in de [documentatie](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-kickstart-syntax#sect-kickstart-packages) alles opgezocht dat "(required)" was.

Testen doormiddel van een nieuwe vm te booten in virtualbox met  "Network" als eerste bootoptie. Bij netwerkopties intern netwerk aanduiden.
Testboot via netwerk gaf veel fouten in verband met de drive "sdb"
 Oplossing : elkens "sdb"veranderen naar "sda", dit is vermoedlijk omdat ik de eerste manuele install via usb deed en hij hierdoor de drive toen sdb noemde.

@minimal package werd niet gevonden => opgelost door weg te halen

De pxeboot was succesvol met de aangepaste basis kickstarter. Vervolgens gaan we de kickstarter file meer configureren:

Verwijderd:

	network  --hostname=localhost.localdomain

Toevoegingen:

```
# Reboot after installation
reboot
```

na reboot gebruikte hij opnieuw de netwerkboot, voeg bij bootloader de optie "--leavebootorder" toe om de installatie als eerste bootoptie in te stellen:

	bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda --leavebootorder

User admin toevoegen

	# Maak user admin aan
	user --name="admin" --password="AdminGreen" --groups="wheel"



## 4. Post installatie scripts

Handige package installeren & het systeem updaten.
Bij post-scripts (tussen %post %end):

	dnf install nano vim wget curl net-tools lsof bash-completion
	dnf update

Om de scripts te testen, heb ik bij virtualbox een NAT adapter toegevoegd als 2e adapter, om zo tot aan het internet te geraken.
Getest: tijdens installatie in de shell successvol 8.8.8.8 kunnen pingen.

Opmerking: bij storage-log krijg ik vaak de melding: "Failed to reset SElinux context for ... -> later kan dit beter bekeken worden

TODO: test of deze geïnstalleerd zijn

Opmerking: voor toekomstige testen is het  misschien een goed idee om "dnf update" in commentaar te zetten, de post-installatie scripts duren momenteel zeer lang.

TODO-------------------------------------------------

automatisch voorgeconfigureerd om in het netwerk opgenomen te worden (bv. administrator-gebruiker, package-installatie, configuratie updates). 

Het systeem kan dan verder geconfigureerd worden via configuration management(ruby based: puppet /chef. python based: saltstack)

stuurt ook meteen informatie over de werking door naar het monitoringsysteem.



sources:

* https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-kickstart-syntax#sect-kickstart-packages