# Testplan November1

## Test MariaDB

1. Is de MariaDB service gestart bij de boot?
    > *sudo systemctl status mariadb*
2. Is de MariaDB service 'Actief'?
    > *sudo systemctl status mariadb*
3. Bestaan de databanken 'drupal_echo1' en 'drupal_mike1'?
    > *mysql -uroot -p${mariadb_root_password} --execute 'show databases'*
4. Hebben de gebruikers 'mike1_user' en 'echo1_user' schrijfrechten voor de aangewezen databanken?
    > SELECT host,user FROM mysql.user;
    > *mysql -u${mike1_user} -pmike1 \ --execute 'CREATE TABLE a (id int); DROP TABLE a;*
5.  De MariaDB mag geen testdatabank en anonieme gebruikers meer hebben,klopt dit?
    > *run mysql -uroot -p${mariadb_root_password} --execute 'show databases' test [ "0" -ne "${status}" ]*
    > *sudo systemctl list-units --type service*
3. Bestaan de databanken 'drupal_echo1' en 'drupal_mike1'?
    > *mysql -uroot -p${mariadb_root_password} --execute 'show tables'*
4. Hebben de gebruikers 'mike1_user' en 'echo1_user' schrijfrechten voor de aangewezen databanken?
    > * show grants for 'mike1_user'@'172.16.1.3';
    > * show grants for 'echo1_user'@'172.16.1.69';
5.  De MariaDB mag geen testdatabank en anonieme gebruikers meer hebben,klopt dit?
    > *run mysql -uroot -p${mariadb_root_password} --execute 'show tables' test [ "0" -ne "${status}" ]*
    > *result=$(mysql -uroot -p${mariadb_root_password} --execute "select * from user where user='';" mysql) [ -z "${result}" ]*
## Test MariaDB galera cluster

1. Zijn de servers geconfigureerd in de ansible config file?

2. Is november1 de master server en november2 en 3 de slave servers? 

3. 


#### OPMERKING BIJ TESTPLAN
>  Het is zo dat men enkel kan inloggen op de drupal_mike1 en drupal_echo1 databases nadat de servers mike1 en echo1 opgezet zijn. Dit komt omdat deze hun users mike1_user en echo1_user enkel priviliges hebben op hun hosts 172.16.1.69 en 172.16.1.3. Dus wanneer deze nog niet opgezet zijn en je wilt inloggen met de accounts zal deze  de error geven dat,indien je de host niet specifieert,*"Access denied for user 'mike1_user'@'localhost'"*
   > Indien men wel de host specifieert krijgt men,indien de servers mike1 en echo1 nog niet zijn opgesteld:
      *"ERROR 2002 (HY000): Can't connect to MySQL server on '172.16.1.3' (115)"*
