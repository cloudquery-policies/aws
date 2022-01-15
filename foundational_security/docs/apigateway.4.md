## \[APIGateway\.4\] API Gateway should be associated with an AWS WAF web ACL<a name="fsbp-apigateway-4"></a>

**Category:** Protect > Protective services

**Severity:** Medium

**Resource type:** `AWS::ApiGateway::Stage`

**AWS Configrule:** [https://docs.aws.amazon.com/config/latest/developerguide/api-gw-associated-with-waf.html](https://docs.aws.amazon.com/config/latest/developerguide/api-gw-associated-with-waf.html)

**Parameters:** None

This control checks whether an API Gateway stage uses an AWS WAF web access control list \(ACL\)\. This control fails if an AWS WAF web ACL is not attached to a REST API Gateway stage\.

AWS WAF is a web application firewall that helps protect web applications and APIs from attacks\. It enables you to configure an ACL, which is a set of rules that allow, block, or count web requests based on customizable web security rules and conditions that you define\. Ensure that your API Gateway stage is associated with an AWS WAF web ACL to help protect it from malicious attacks\.

**Note**  
This control is not supported in the following Regions:  
 Asia Pacific \(Osaka\)
China \(Beijing\)
China \(Ningxia\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="apigateway-4-remediation"></a>

For information on how to use the API Gateway console to associate an AWS WAF Regional web ACL with an existing API Gateway API stage, see [Using AWS WAF to protect your APIs](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-control-access-aws-waf.html) in the *API Gateway Developer Guide*\.

