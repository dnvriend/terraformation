# Amazon Certificate Manager (ACM)


## DNS Validation
After your DNS provider propagates your record update, it can take up to several hours for ACM to validate the domain name 
and issue the certificate. During this time, ACM shows the validation status as `Pending validation`. After validating the 
domain name, ACM changes the validation status to `Success`. After AWS issues the certificate, ACM changes the certificate status to Issued.

If ACM is not able to validate the domain name within `72 hours` from the time it generates a CNAME value for you, 
ACM changes the certificate status to Validation timed out. The most likely reason for this result is that you did not 
update your DNS configuration with the value that ACM generated. To remedy this issue, you must request a new certificate.

## Resources
- [What Is AWS Certificate Manager?](https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html)