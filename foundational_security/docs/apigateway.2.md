## \[APIGateway\.2\] API Gateway REST API stages should be configured to use SSL certificates for backend authentication<a name="fsbp-apigateway-2"></a>

**Category:** Protect > Data protection

**Severity:** Medium

**Resource type:** `AWS::ApiGateway::Stage`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/api-gw-ssl-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/api-gw-ssl-enabled.html)

**Parameters:** None

This control checks whether Amazon API Gateway REST API stages have SSL certificates configured\. Backend systems use these certificates to authenticate that incoming requests are from API Gateway\.

API Gateway REST API stages should be configured with SSL certificates to allow backend systems to authenticate that requests originate from API Gateway\.

**Note**  
This control is not supported in the following Regions:  
Asia Pacific \(Osaka\)
China \(Beijing\)
China \(Ningxia\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="apigateway-2-remediation"></a>

For detailed instructions on how to generate and configure API Gateway REST API SSL certificates, see [Generate and configure an SSL certificate for backend authentication](https://docs.aws.amazon.com/apigateway/latest/developerguide/getting-started-client-side-ssl-authentication.html) in the *API Gateway Developer Guide*\.

