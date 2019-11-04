# Testrapport November1

## Test MariaDB

1. Mariadb server is enabled en start on boot

```
Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled; vendor preset: disabled)
```

2. Mariadb is active

```
Active: active (running) since Mon 2019-11-04 12:56:38 UTC; 11min ago
```

3. De databases voor echo1 en mike1 bestaan

```
+--------------------+
| Database           |
+--------------------+
| drupal_echo1       |
| drupal_mike1       |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
5 rows in set (0.001 sec)
```

4. Queries worden succesvol uitgevoerd, users voor echo1 en mike1 hebben alle permissions op hun respectievelijke databanken

5. Er zijn geen test databanken en anonieme users aanwezig

Databanken:

```
+--------------------+   
| Database           |   
+--------------------+   
| drupal_echo1       |   
| drupal_mike1       |   
| information_schema |   
| mysql              |   
| performance_schema |   
+--------------------+
```

Users:

```
+------------+
| root       |
| mike1_user |
| echo1_user |
| root       |
| mysql      |
| root       |
+------------+
```

## Test MariaDB Galera cluster

TO DO