# Documentatie

## To Do

- [x] Zoeken naar goede ansible role
- [ ] Prometheus laten draaien op server `oscar1`
- [ ] Prometheus op anders servers installeren
- [ ] Zorgen dat andere servers naar prometheus rapporteren
- [ ] Querying zodat juiste informatie wordt getoond
- [ ] Installatie *Grafana* met ansible
- [ ] Zorgen dat alles correct wordt weergegeven op grafana

## Notes to Stijn

> Bij testen zorgen dat je andere servers in `ansible/servers.yml` in commentaar zet. Deze gaven bij mij soms foutmeldingen omdat er dingen bij hen nog niet werken.
>
> Installatie lukt bij mij, zie [output](commandoutput.txt).
>
> Pingen naar het ip-adres van oscar1 (`172.16.1.5`), gaat zonder problemen, maar als ik `172.16.1.5:9100`(!1) probeer te openen in Firefox, dan lukt dit niet. Dit al geprbeerd maar werkte niet:
>
> * Firewallregel toevoegen met http en https (`sudo firewall-cmd --add-service http`)
> * Log over prometheus nog niet gevonden, als je dit googled krijg je resultaten van hoe logs er in importeren of hoe de logs bekijken als het draait op docker
>
> !1: deze poort staat ingesteld in [server.yml](/ansible/servers.yml)

## Stappenplan opzetten

1. `vagrant up oscar1`

## Stappenplan enkele server

1. Installeer prometheus-role van [Ansible Galaxy](https://galaxy.ansible.com/cloudalchemy/prometheus):

```bash
ansible-galaxy install cloudalchemy.prometheus
```

2. Vul het playbook aan met volgende code

```yml
---
- hosts: all
  roles:
  - cloudalchemy.prometheus
  vars:
    prometheus_targets:
      node:
      - targets:
        - localhost:9100
        - demo.cloudalchemy.org:9100
        labels:
          env: demosite
```
