# Documentatie

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