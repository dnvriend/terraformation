# requests

## Ignoring verifying the SSL Certificate
Requests can also ignore verifying the SSL certficate if you set  verify to False.

```python
requests.get('https://kennethreitz.com', verify=False)
```

## Resources
- [How do I disable the security certificate check in Python requests](https://stackoverflow.com/questions/15445981/how-do-i-disable-the-security-certificate-check-in-python-requests)