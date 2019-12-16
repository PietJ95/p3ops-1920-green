# Testplan November1

## Test MariaDB

1. Is de MariaDB service gestart bij de boot en actief?
    > *sudo systemctl status mariadb*
    > *sudo systemctl status mariadb*
2. Bestaan de databanken 'drupal_echo1' en 'drupal_mike1'?
    > *mysql -uroot -p${mariadb_root_password} --execute 'show databases'*
3. Hebben de gebruikers 'mike1_user' en 'echo1_user' schrijfrechten voor de aangewezen databanken?
    > SELECT host,user FROM mysql.user;
    > *mysql -u${mike1_user} -pmike1 \ --execute 'CREATE TABLE a (id int); DROP TABLE a;*
4.  De MariaDB mag geen testdatabank en anonieme gebruikers meer hebben,klopt dit?
    > *run mysql -uroot -p${mariadb_root_password} --execute 'show databases' test [ "0" -ne "${status}" ]*
    > *sudo systemctl list-units --type service*
6. Hebben de gebruikers 'mike1_user' en 'echo1_user' schrijfrechten voor de aangewezen databanken?
    > * show grants for 'mike1_user'@'172.16.1.3';
    > * show grants for 'echo1_user'@'172.16.1.69';
5.  De MariaDB mag geen testdatabank en anonieme gebruikers meer hebben,klopt dit?
    > *run mysql -uroot -p${mariadb_root_password} --execute 'show tables' test [ "0" -ne "${status}" ]*

#### OPMERKING BIJ TESTPLAN
>  Het is zo dat men enkel kan inloggen op de drupal_mike1 en drupal_echo1 databases nadat de servers mike1 en echo1 opgezet zijn. Dit komt omdat deze hun users mike1_user en echo1_user enkel priviliges hebben op hun hosts 172.16.1.69 en 172.16.1.3. Dus wanneer deze nog niet opgezet zijn en je wilt inloggen met de accounts zal deze  de error geven dat,indien je de host niet specifieert,*"Access denied for user 'mike1_user'@'localhost'"*
   > Indien men wel de host specifieert krijgt men,indien de servers mike1 en echo1 nog niet zijn opgesteld:
      *"ERROR 2002 (HY000): Can't connect to MySQL server on '172.16.1.3' (115)"*
