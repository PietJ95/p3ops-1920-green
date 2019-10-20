Ansible-Role: 389-ds
=========

An role which install 389 Directory Server on RedHat/Debian servers.

Requirements
------------

None

Role Variables
--------------

See defaults/main.yml for the variables you can overwrite via role call as a parameter.

* dirsrv_state: latest
* dirsrv_password: not_set_yet
* dirsrv_admin_password: ( Default: dirsrv_password )

* dirsrv_fqdn: ( Default: ldap.local.dev )
* dirsrv_suffix: ( Default: last two parts from dirsrv_fqdn )
* dirsrv_hostname: ( Default: first part from dirsrv_fqdn )

Dependencies
------------

None

Example Playbook
----------------

    - hosts: all
      roles:
        - { role: net2grid.389-ds }
