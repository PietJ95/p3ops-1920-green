# Testrapport Charlie1

Author: [Jolien Vervinckt](https://github.com/JolienVervinckt) 

## Before
[Testplan Charlie1](testplan.md) was run on a pc with Ansible already installed. These were the results:

## Testresults
After executing steps 1-8 I encountered a problem with the /etc/resolv.conf file. 
I changed the nameserver as instructed and kept the rest of the code.

```bash
search hogent.be
nameserver 172.16.1.66
nameserver 172.16.1.67
options single-request-reopen

```

I could not ping "charlie1.green.local" because of the first line. After I deleted this line everything ran smoothly.
The following output is the result of a succesfull ping from the bravo1-server to the charlie1-server. 
I used the bravo1-server for the ping since my own device was not in the 172.16 network.


```bash
[root@bravo1 ~]# ping charlie1.green.local
PING charlie1.green.local (172.16.1.67) 56(84) bytes of data.
64 bytes from 172.16.1.67 (172.16.1.67): icmp_seq=1 ttl=64 time=0.268 ms
64 bytes from 172.16.1.67 (172.16.1.67): icmp_seq=2 ttl=64 time=0.428 ms
64 bytes from 172.16.1.67 (172.16.1.67): icmp_seq=3 ttl=64 time=0.188 ms
64 bytes from 172.16.1.67 (172.16.1.67): icmp_seq=4 ttl=64 time=0.218 ms
64 bytes from 172.16.1.67 (172.16.1.67): icmp_seq=5 ttl=64 time=0.200 ms
64 bytes from 172.16.1.67 (172.16.1.67): icmp_seq=6 ttl=64 time=0.339 ms
64 bytes from 172.16.1.67 (172.16.1.67): icmp_seq=7 ttl=64 time=0.354 ms
64 bytes from 172.16.1.67 (172.16.1.67): icmp_seq=8 ttl=64 time=0.535 ms
64 bytes from 172.16.1.67 (172.16.1.67): icmp_seq=9 ttl=64 time=0.329 ms
64 bytes from 172.16.1.67 (172.16.1.67): icmp_seq=10 ttl=64 time=0.379 ms
64 bytes from 172.16.1.67 (172.16.1.67): icmp_seq=11 ttl=64 time=0.262 ms
64 bytes from 172.16.1.67 (172.16.1.67): icmp_seq=12 ttl=64 time=0.430 ms
64 bytes from 172.16.1.67 (172.16.1.67): icmp_seq=13 ttl=64 time=0.352 ms
^C
--- charlie1.green.local ping statistics ---
13 packets transmitted, 13 received, 0% packet loss, time 12008ms
rtt min/avg/max/mdev = 0.188/0.329/0.535/0.098 ms
```
