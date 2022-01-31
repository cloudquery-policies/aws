## \[APIGateway\.3\] API Gateway REST API stages should have AWS X\-Ray tracing enabled

**Category:** Detect > Detection services

**Severity:** Low

**Resource type:** `AWS::ApiGateway::Stage`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/api-gw-xray-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/api-gw-xray-enabled.html)

**Parameters:** None

This control checks whether AWS X\-Ray active tracing is enabled for your Amazon API Gateway REST API stages\.

X\-Ray active tracing enables a more rapid response to performance changes in the underlying infrastructure\. Changes in performance could result in a lack of availability of the API\. X\-Ray active tracing provides real\-time metrics of user requests that flow through your API Gateway REST API operations and connected services\.

**Note**  
This control is not supported in the following Regions:  
Asia Pacific \(Osaka\)
China \(Beijing\)
China \(Ningxia\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="apigateway-3-remediation"></a>

For detailed instructions on how to enable X\-Ray active tracing for API Gateway REST API operations, see [Amazon API Gateway active tracing support for AWS X\-Ray](https://docs.aws.amazon.com/xray/latest/devguide/xray-services-apigateway.html) in the *AWS X\-Ray Developer Guide*\. 

