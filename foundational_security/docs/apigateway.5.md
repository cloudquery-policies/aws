## \[APIGateway\.5\] API Gateway REST API cache data should be encrypted at rest

**Category:** Protect > Data protection > Encryption of data at rest

**Severity:** Medium

**Resource type:** `AWS::ApiGateway::Stage`

AWS Config rule: `api-gw-cache-encrypted` \(Custom rule developed by Security Hub\)

**Parameters:** None

This control checks whether all methods in API Gateway REST API stages that have cache enabled are encrypted\. The control fails if any method in an API Gateway REST API stage is configured to cache and the cache is not encrypted\.

Encrypting data at rest reduces the risk of data stored on disk being accessed by a user not authenticated to AWS\. It adds another set of access controls to limit unauthorized users ability access the data\. For example, API permissions are required to decrypt the data before it can be read\.

API Gateway REST API caches should be encrypted at rest for an added layer of security\.

### Remediation<a name="apigateway-5-remediation"></a>

To remediate this control, configure the stage to encrypt the cache data\.

**To configure API caching for a given stage**

1. Open the API Gateway console at [https://console\.aws\.amazon\.com/apigateway/](https://console.aws.amazon.com/apigateway/)\. 

1. Choose the API\.

1. Choose **Stages**\.

1. In the **Stages** list for the API, choose the stage to add caching to\.

1. Choose **Settings**\.

1. Choose **Enable API cache**\.

1. Update the desired settings, then select **Encrypt cache data**\.

1. Choose **Save Changes**\.

