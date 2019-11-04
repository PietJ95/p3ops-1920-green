# Testplan November1

## Test MariaDB

1. Is de MariaDB service gestart bij de boot?
    > *sudo systemctl status mariadb*
2. Is de MariaDB service 'Actief'?
    > *sudo systemctl list-units --type service*
3. Bestaan de databanken 'drupal_echo1' en 'drupal_mike1'?
    > *mysql -uroot -p${mariadb_root_password} --execute 'show tables'*
4. Hebben de gebruikers 'mike1_user' en 'echo1_user' schrijfrechten voor de aangewezen databanken?
    > *mysql -u${mike1_user} -pmike1 \ --execute 'CREATE TABLE a (id int); DROP TABLE a;*
5.  De MariaDB mag geen testdatabank en anonieme gebruikers meer hebben,klopt dit?
    > *run mysql -uroot -p${mariadb_root_password} --execute 'show tables' test [ "0" -ne "${status}" ]*
    > *result=$(mysql -uroot -p${mariadb_root_password} --execute "select * from user where user='';" mysql) [ -z "${result}" ]*
## Test MariaDB galera cluster

1. Zijn de servers geconfigureerd in de ansible config file?

2. Is november1 de master server en november2 en 3 de slave servers? 
