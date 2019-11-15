# Testplan papa1 voor productierelease
## Internet connectiviteit (DNS)
DNS resolving moet werken: 

    ping google.be
## Services
Controleer dat volgende services correct draaien: 
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

## DHCP Server
DHCP server moet up en bereikbaar zijn:

    ping 172.16.1.1

## Connectiviteit met nieuwe vm's
- Blanco VM booten met netwerkboot
- Blauw scherm moet zichtbaar worden met opties voor CentOS8 en Fedora Workstation
- Beide opties testen: files moeten correct inladen en installatie moet doorgaan tot aan het kickstart deel  

&rarr; Hier volgt het testplan voor de Kickstart configuratie, valt buiten de scope van het PXE Server testplan.