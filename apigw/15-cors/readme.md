# 15-cors

## Valid CORS

## Access-Control-Allow_origin (required)
Access-Control-Allow-Origin (required) - This header must be included in all valid CORS responses; omitting the header 
will cause the CORS request to fail. The value of the header can either echo the Origin request header (as in the example above), 
or be a '*' to allow requests from any origin. If you’d like any site to be able to access your data, using '*' is fine. 
But if you’d like finer control over who can access your data, use an actual value in the header.

## Resources
- [Understanding CORS](https://spring.io/understanding/CORS)
- [Using CORS](https://www.html5rocks.com/en/tutorials/cors/)
- [Access-Control-Allow-Methods](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Methods)