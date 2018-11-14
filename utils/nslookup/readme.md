# nslookup
Nslookup is a program to query Internet domain name servers.  Nslookup has two modes: interactive and non-interactive. 
Interactive mode allows the user to query name servers for information about various hosts and domains or to print a list 
of hosts in a domain. Non-interactive mode is used to print just the name and requested information for a host or domain.

The command `dig` is seen as the alternative to `nslookup`.

## Example
By default, nslookup queries for 'A' records. To look for 'NS' records type:

```text
$ nslookup -querytype=NS dnvriend.com
Server:         217.21.244.66
Address:        217.21.244.66#53

Non-authoritative answer:
dnvriend.com    nameserver = ns-905.awsdns-49.net.
dnvriend.com    nameserver = ns-1594.awsdns-07.co.uk.
dnvriend.com    nameserver = ns-1442.awsdns-52.org.
dnvriend.com    nameserver = ns-310.awsdns-38.com.

Authoritative answers can be found from:
```

Non-authoritative answer means that this answer comes from a cache, like a DNS server in your router, your company 
DNS server or your operating system cached server. You can see what server answered the request. The server that answered
the DNS query/request is mentioned on the top, which is `217.21.244.66`. Port 53 is the DNS port. 
