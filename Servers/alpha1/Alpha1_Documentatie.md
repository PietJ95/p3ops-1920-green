# Alpha1

**Ter referentie**

De mappenstructuur van het project ziet eruit als volgt:
```
C:\Users\Milan\Desktop\OFFLINE FOR TESTING>tree
Folder PATH listing
Volume serial number is 8291-CBC9
C:.
├───.vagrant
│   ├───machines
│   │   └───Alpha1
│   │       └───virtualbox
│   └───rgloader
├───ansible
│   ├───group_vars
│   └───roles
│       └───LDAP
│           ├───defaults
│           ├───files
│           ├───handlers
│           ├───meta
│           ├───tasks
│           ├───templates
│           └───vars
```
## Stap 1: Ansible structuur
Eerst en vooral voegen we onze server toe aan de `hosts.yml` file en kennen we `172.16.1.65` als ip-adres aan de server toe, dit volgens de adresseringstabel te vingen in de readme.
Vervolgens gaan we naar `ansible/servers.yml`.

Dit bestand is de playbook voor alle servers en zorgt ervoor dat deze gerund worden adhv hun rollen.
```
# servers.yml
---
- name: Install Alpha1
  hosts: Alpha1
  remote_user: root
  roles:
    - LDAP
```
Volgens de Ansible Best Practices krijgt elke server een rol. In ons geval is dat dus 'LDAP'. Om deze rol toe te passen, maken we een map 'LDAP' aan binnen de `ansible/roles` map.
In deze map staan 6 directories die we nodig hebben om volgens de best practices de rol op te bouwen. In de `LDAP/tasks` map vinden we main.yml terug.

Dit bestand zorgt ervoor dat OpenLDAP wordt geïnstalleerd en kijkt of de service runt.
```
#tasks/main.yml for LDAP role
---
# - name: load variables
  # include_vars:
    # file: vars.yml

- name: install OpenLDAP
  yum: 
    name: "{{ packages }}"
    state: latest
  vars:
    packages:
    - openldap
    - openldap-servers
    - openldap-clients
    
- name: ensure OpenLDAP is running
  service:
    name: slapd
    state: started
    enabled: yes
```

Als we nu `vagrant up` doen in de hoofddirectory, brengt vagrant alle servers in de hosts.yml file online en past de rollen toe.

**OpenLDAP is geïnstalleerd en runt op Alpha1**