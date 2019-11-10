#!/usr/bin/env bats

nic="eth1"

# IP and routing
@test "Correct IP address" {
    ipaddr="172.16.1.68"
    # Courtesy of https://stackoverflow.com/questions/13322485/
    result=$(ip a | grep ${nic} | sed -En 's/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
    [ "${result}" = "${ipaddr}" ]
}
@test "Correct default gateway for ${nic}" {
    gateway="172.16.1.94"
    result=$(cat /etc/sysconfig/network-scripts/ifcfg-${nic} | grep 'GATEWAY=')
    [ "${result}" = "GATEWAY=${gateway}" ]
}

# Firewall
@test "Firewall is running" {
    result=$(sudo systemctl status firewalld | grep 'Active' | sed 's/^[[:space:]]*//' | cut -d' ' -f1-3)
    [ "${result}" = "Active: active (running)" ]
}
@test "Correct services allowed through firewall" {
    result=$(sudo firewall-cmd --list-all | grep 'services' | sed 's/^[[:space:]]*//')
    [ "${result}" = "services: ssh dhcpv6-client http https pop3 pop3s imap imaps smtp smtps smtp-submission" ]
}
@test "Correct ports allowed through firewall" {
    result=$(sudo firewall-cmd --list-all | grep 'ports' | head -1 | sed 's/^[[:space:]]*//')
    [ "${result}" = "ports: 9100/tcp 587/tcp" ]
}