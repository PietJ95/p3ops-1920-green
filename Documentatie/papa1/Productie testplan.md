# Testplan papa1 voor productierelease

## Services
Controleer op de PXEserver dat volgende services correct draaien: 
- nginx

        systemctl status nginx
- xinetd
        
        systemctl status xinetd

## Mounts
Verifiëer dat de iso files correct gemount zijn:

    cat /proc/mounts | grep /var/www/html
Moet als uitvoer geven:

    /dev/loop0 /var/www/html/centos8 iso9660 ro,relatime 0 0
    /dev/loop1 /var/www/html/fedora iso9660 ro,relatime 0 0

## Connectiviteit met nieuwe vm's
- Werkstation booten met als eerste bootoptie "boot via network"
- Blauw scherm moet zichtbaar worden met opties voor CentOS8 en Fedora Workstation
- Bij het kiezen van de CentOS8 optie worden de installatie files gemount en begint de installatie van de OS zonder foutmeldingen
- Bij het kiezen van de Fedora optie worden de correcte files gemount en begint de installatie van de OS zonder foutmeldingen

&rarr; De hosts geboot & geïnstalleerd adhv de PXEboot server worden apart getest adhv test files. Deze bevinden zich buiten het algemeen testplan.