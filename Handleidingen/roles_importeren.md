Aangezien je op een Windows pc geen 'Ansible' of 'Ansible Galaxy' kan gebruiken moeten we roles anders importeren,
Bij SME linux opdracht heb je een script 'role-deps.sh' 
Door in je Terminal(vb GitBash) naar de directory te gaan van het script en dit script laten uitvoeren.
VOORALEER je dit doet zal je wel in je 'site.yml' de role moeten vernoemen,zoals men bij de SME opdracht van linux zou doen:
-hosts: pu001
  become: true
  roles:
    -bertvv.rh-base

Als gevolg zal deze een role(die je anders van Ansible galaxy gaat halen) importeren in je folder.
























~Dylano Steenhuyzen

