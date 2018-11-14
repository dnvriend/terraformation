# dig
dig (domain information groper) is a flexible tool for interrogating DNS name servers. It performs DNS lookups and 
displays the answers that are returned from the name server(s) that were queried.

Most DNS administrators use dig to troubleshoot DNS problems because of its flexibility, ease of use and clarity of output. 
Other lookup tools tend to have less functionality than dig.

Dig is seen as the replacement for `nslookup`.

## example
Note the following when using Dig:

- Dig: search for DNS records, default it searches for the A record.
- Dig displays a question section and an answer section. 
- To look for NS records, type: `dig dnvriend.com NS`

You should get answers like:

```text
; <<>> DiG 9.10.6 <<>> dnvriend.com NS
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 40943
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;dnvriend.com.                  IN      NS

;; ANSWER SECTION:
dnvriend.com.           27403   IN      NS      ns-1442.awsdns-52.org.
dnvriend.com.           27403   IN      NS      ns-1594.awsdns-07.co.uk.
dnvriend.com.           27403   IN      NS      ns-310.awsdns-38.com.
dnvriend.com.           27403   IN      NS      ns-905.awsdns-49.net.

;; Query time: 291 msec
;; SERVER: 217.21.244.66#53(217.21.244.66)
;; WHEN: Tue Oct 09 09:28:57 CEST 2018
;; MSG SIZE  rcvd: 178
```

The answer here is non-authoritive, which means it comes from a cache which is the server mentioned below which is 
`217.21.244.66` in this example. Port 53 is the DNS port.

## Options

```text
-x addr
Simplified reverse lookups, for mapping addresses to names. The addr is an IPv4 address in dotted-decimal notation, or 
a colon-delimited IPv6 address. When the -x is used, there is no need to provide the name, class and type arguments.
dig automatically performs a lookup for a name like 94.2.0.192.in-addr.arpa and sets the query type and class to PTR 
and IN respectively. IPv6 addresses are looked up using nibble format under the IP6.ARPA domain (but see also the -i option).

+[no]short
Provide a terse answer. The default is to print the answer in a verbose form.
```

