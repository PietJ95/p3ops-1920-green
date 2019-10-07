# p3ops-team-repo

## Takenverdeling

[Google docs](https://docs.google.com/spreadsheets/d/10ZtNAXkEyRat8Yl4fSzGJcRiKkjTG_0TkfBVWvXb0Lc/edit?usp=sharing)

## Trello board

Invite link: [Trello invite](https://trello.com/invite/b/3mZIkr7D/c77776add109cb1083b3267c9787840d/p3ops-1920-green)

Doorverwijslink: [Trello board](https://trello.com/b/3mZIkr7D/p3ops-1920-green)

## Communicatieplatform

Slack: [join Slack channel](https://join.slack.com/t/projecteniiigreen/shared_invite/enQtNzcxNjUyMTY5NDc5LTI0M2JiMTc2MDBhZjVlY2M5Y2MzZTczYWU4NGQ5ODNlZDVlNTgyZDA3YWJjZGMwMTdmYWQ4OWU4MmRlODFiYTQ)

## Taakverdeling teamleden

De kolom "Uitvoering" bevat de verantwoordelijke voor het realiseren van de taak, "Testen" is voor de verantwoordelijke voor de acceptatietests (schrijft dus testrapport). De naam van de verantwoordelijke is een link naar diens Github profielpagina, bv. [Bert Van Vreckem](https://github.com/bertvv/).

| Taak | Uitvoering | Testen |
| :--- | :---       | :---   |
|      |            |        |

## Overzicht IP-adrestoewijzing

### Overzicht netwerk

| Subnet | Aantal hosts | Netwerk adres | Mask | Subnetmask | Range | Broadcast |
| :--- | :---       | :---   | :---   | :---   | :---   | :---   |
|20|128|172.16.0.0 |/24|255.255.255.0|172.16.0.1 - 172.16.0.254|172.16.0.255|
|30|40|172.16.1.0|/26|255.255.255.192|172.16.1.1 - 172.16.1.62|172.16.1.63|
|50|30|172.16.1.64|/27|255.255.255.224|172.16.1.65 - 172.16.1.94|172.16.1.95|
|40|2|172.16.1.96|/30|255.255.255.252|172.16.1.97 - 172.16.1.98|172.16.1.99|
|60|2|172.16.1.100|/30|255.255.255.252|172.16.1.101 - 172.16.1.102|172.16.1.103|
|70|2|172.16.1.104|/30|255.255.255.252|172.16.1.105 - 172.16.1.106|172.16.1.107|

### IP-adressen

| Naam | VLAN | IP-adres |
| :--- | :---       | :---   |
| Alpha1 | VLAN 50 | 172.16.1.65 |
| Bravo1 | VLAN 50 | 172.16.1.66 |
| Charlie1 | VLAN 50 | 172.16.1.67 |
| Delta1 | VLAN 50 | 172.16.1.68 |
| Echo1 | VLAN 50 | 172.16.1.69 |
| Kilo1 | VLAN 30 | 172.16.1.1 |
| Lima1 | VLAN 30 | 172.16.1.2 |
| Mike1 | VLAN 30 | 172.16.1.3 |
| November1 | VLAN 30 | 172.16.1.4 |
| Oscar1 | VLAN 30 | 172.16.1.5 |
| Papa1 | VLAN 30 | 172.16.1.6 |
| Zulu1 | VLAN 70 | 172.16.1.106 |
| Zulu1 | VLAN 60 | 172.16.1.102 |
| Router0 | VLAN 70 | 172.16.1.105 |
| Switch1 | VLAN 40 | 172.16.1.97 |
| Switch2 | VLAN 40 | 172.16.1.98 |
| Switch2 | VLAN 60 | 172.16.1.101 |
| Clients | VLAN 20 | 172.16.0.1 - 172.16.0.254 (DHCP) |
| Management | VLAN 99 | 172.16.99.1 |


## Overzicht documentatie



## TODOs

- [ ] Overzichten in deze README
    - [ ] taakverdeling met verantwoordelijken
    - [ ] inhoudstafel documentatie
    - [ ] IP-adrestoewijzingen
- [ ] Directorystructuur
    - [ ] broncode met duidelijke, logische structuur
        - Linux: layout volgens [Ansible best practices](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html). Gebruik evt. <https://github.com/bertvv/ansible-skeleton> als basis.
    - [ ] documentatie
        - per deeltaak:
            - lastenboek
            - technische documentatie, incl. verslag opzoekwerk
            - testplannen en -rapporten
        - draaiboek productie-release
        - integratietestplannen
    - [ ] Verslagen stand-ups en ander overleg
