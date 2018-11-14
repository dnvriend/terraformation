# 16-rate-limit

## How Throttling Limit Settings Are Applied in API Gateway
There are two types of throttling related settings:

- **Server-side throttling**: These limits are applied across all clients. These limit settings exist to prevent your 
API and your account from being overwhelmed by too many requests.
- **Per-client throttling**: These limits are applied to clients that use API keys associated with your usage policy as client identifier.

API Gateway throttling-related settings are applied in the following order:
- Per-client per-method throttling limits that you set for an API stage in a usage plan
- Per-client throttling limits that you set in a usage plan
- Default per-method limits and individual per-method limits that you set in API stage settings
- Account-level throttling

## Exceeding the rate limit
When request submissions exceed the steady-state request rate and burst limits, API Gateway fails the limit-exceeding 
requests and returns 429 Too Many Requests error responses to the client. Upon catching such exceptions, the client can 
resubmit the failed requests in a rate-limiting fashion, while complying with the API Gateway throttling limits.

## Account-level throttling
By default, API Gateway limits the steady-state request rate to 10,000 requests per second (rps). It limits the burst 
(that is, the maximum bucket size) to 5,000 requests across all APIs within an AWS account.




## Resources
- [API Gateway Request Throttling](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-request-throttling.html)