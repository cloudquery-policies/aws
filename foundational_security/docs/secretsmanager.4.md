## \[SecretsManager\.4\] Secrets Manager secrets should be rotated within a specified number of days

**Category:** Protect > Secure access management

**Severity:** Medium

**Resource type:** `AWS::SecretsManager::Secret`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/secretsmanager-secret-periodic-rotation.html](https://docs.aws.amazon.com/config/latest/developerguide/secretsmanager-secret-periodic-rotation.html)

**Parameters:**
+ **Rotation period:** 90 days by default

This control checks whether your secrets have been rotated at least once within 90 days\.

Rotating secrets can help you to reduce the risk of an unauthorized use of your secrets in your AWS account\. Examples include database credentials, passwords, third\-party API keys, and even arbitrary text\. If you do not change your secrets for a long period of time, the secrets are more likely to be compromised\.

As more users get access to a secret, it can become more likely that someone mishandled and leaked it to an unauthorized entity\. Secrets can be leaked through logs and cache data\. They can be shared for debugging purposes and not changed or revoked once the debugging completes\. For all these reasons, secrets should be rotated frequently\.

You can configure your secrets for automatic rotation in AWS Secrets Manager\. With automatic rotation, you can replace long\-term secrets with short\-term ones, significantly reducing the risk of compromise\.

Security Hub recommends that you enable rotation for your Secrets Manager secrets\. To learn more about rotation, see [Rotating your AWS Secrets Manager secrets](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html) in the *AWS Secrets Manager User Guide*\.

**Note**  
This control is not supported in the following Regions:  
Asia Pacific \(Osaka\)
China \(Beijing\)
China \(Ningxia\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="secretsmanager-4-remediation"></a>

You can enable automatic secret rotation in the Secrets Manager console\.

**To enable secret rotation**

1. Open the Secrets Manager console at [https://console\.aws\.amazon\.com/secretsmanager/](https://console.aws.amazon.com/secretsmanager/)\.

1. To locate the secret, enter the secret name in the search box\.

1. Choose the secret to display\.

1. Under **Rotation configuration**, choose **Edit rotation**\.

1. From **Edit rotation configuration**, choose **Enable automatic rotation**\.

1. From **Select Rotation Interval**, choose the rotation interval\.

1. Choose a Lambda function to use for rotation\.

1. Choose **Next**\.

1. After you configure the secret for automatic rotation, under **Rotation Configuration**, choose** Rotate secret immediately**\.

