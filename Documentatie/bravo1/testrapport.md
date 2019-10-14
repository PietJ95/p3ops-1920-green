# Testrapport Bravo1

Author: [Jolien Vervinckt](https://github.com/JolienVervinckt) 

## Before
[Testplan Bravo1](testplan.md) was run on a pc with Ansible already installed. These were the results:

## Testresults
After executing steps 1-8 I encountered a problem with the /etc/resolv.conf file. 
I changed the nameserver as instructed and kept the rest of the code.

```bash
search hogent.be
nameserver 172.16.1.66
nameserver 172.16.1.67
options single-request-reopen

```

I could not ping "bravo1.green.local" because of the first line. After I deleted this line everything ran smoothly.
The following output is the result of a succesfull ping from the charlie1-server to the bravo1-server.

```bash
[vagrant@charlie1 ~]$ ping bravo1.green.local
PING bravo1.green.local (172.16.1.66) 56(84) bytes of data.
64 bytes from 172.16.1.66 (172.16.1.66): icmp_seq=1 ttl=64 time=0.244 ms
64 bytes from 172.16.1.66 (172.16.1.66): icmp_seq=2 ttl=64 time=0.396 ms
64 bytes from 172.16.1.66 (172.16.1.66): icmp_seq=3 ttl=64 time=0.328 ms
64 bytes from 172.16.1.66 (172.16.1.66): icmp_seq=4 ttl=64 time=0.325 ms
64 bytes from 172.16.1.66 (172.16.1.66): icmp_seq=5 ttl=64 time=0.336 ms
64 bytes from 172.16.1.66 (172.16.1.66): icmp_seq=6 ttl=64 time=0.318 ms
64 bytes from 172.16.1.66 (172.16.1.66): icmp_seq=7 ttl=64 time=0.331 ms
64 bytes from 172.16.1.66 (172.16.1.66): icmp_seq=8 ttl=64 time=0.334 ms
64 bytes from 172.16.1.66 (172.16.1.66): icmp_seq=9 ttl=64 time=0.321 ms
64 bytes from 172.16.1.66 (172.16.1.66): icmp_seq=10 ttl=64 time=0.386 ms
64 bytes from 172.16.1.66 (172.16.1.66): icmp_seq=11 ttl=64 time=0.299 ms
64 bytes from 172.16.1.66 (172.16.1.66): icmp_seq=12 ttl=64 time=0.291 ms
64 bytes from 172.16.1.66 (172.16.1.66): icmp_seq=13 ttl=64 time=0.432 ms
^C
--- bravo1.green.local ping statistics ---
13 packets transmitted, 13 received, 0% packet loss, time 12012ms
rtt min/avg/max/mdev = 0.244/0.333/0.432/0.052 ms
```
