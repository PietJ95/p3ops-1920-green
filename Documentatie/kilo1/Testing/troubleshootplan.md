# Troubleshootplan DHCP

- checken of daemon runt/ restarten

  - ```
    systemctl status dhcpd
    ```

- ip adressen controleren

  - ```
     ip a
    ```

- route controleren/ default gateway 

  - ```
    ip r
    ```

- config controleren 

  - ```
    vi /etc/dhcp/dhcpd.conf
    ```

