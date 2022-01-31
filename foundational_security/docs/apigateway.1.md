## \[APIGateway\.1\] API Gateway REST and WebSocket API logging should be enabled

**Category:** Identify > Logging

**Severity:** Medium

**Resource type:** `AWS::ApiGateway::Stage`, `AWS::ApiGatewayV2::Stage`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/api-gw-execution-logging-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/api-gw-execution-logging-enabled.html)

**Parameters:** None

This control checks whether all stages of an Amazon API Gateway REST or WebSocket API have logging enabled\. The control fails if logging is not enabled for all methods of a stage or if `loggingLevel` is neither `ERROR` nor `INFO`\.

API Gateway REST or WebSocket API stages should have relevant logs enabled\. API Gateway REST and WebSocket API execution logging provides detailed records of requests made to API Gateway REST and WebSocket API stages\. The stages include API integration backend responses, Lambda authorizer responses, and the `requestId` for AWS integration endpoints\.

**Note**  
This control is not supported in the following Regions:  
Africa \(Cape Town\)
Europe \(Milan\)

### Remediation<a name="apigateway-1-remediation"></a>

To enable logging for REST and WebSocket API operations, see [Set up CloudWatch API logging using the API Gateway console](https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-logging.html#set-up-access-logging-using-console) in the *API Gateway Developer Guide*\.

