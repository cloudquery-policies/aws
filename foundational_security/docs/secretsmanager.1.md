## \[SecretsManager\.1\] Secrets Manager secrets should have automatic rotation enabled

**Category:** Protect > Secure development

**Severity:** Medium

**Resource type:** `AWS::SecretsManager::Secret`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/secretsmanager-rotation-enabled-check.html](https://docs.aws.amazon.com/config/latest/developerguide/secretsmanager-rotation-enabled-check.html)

**Parameters:** None

This control checks whether a secret stored in AWS Secrets Manager is configured with automatic rotation\.

Secrets Manager helps you improve the security posture of your organization\. Secrets include database credentials, passwords, and third\-party API keys\. You can use Secrets Manager to store secrets centrally, encrypt secrets automatically, control access to secrets, and rotate secrets safely and automatically\.

Secrets Manager can rotate secrets\. You can use rotation to replace long\-term secrets with short\-term ones\. Rotating your secrets limits how long an unauthorized user can use a compromised secret\. For this reason, you should rotate your secrets frequently\. To learn more about rotation, see [Rotating your AWS Secrets Manager secrets](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html) in the *AWS Secrets Manager User Guide*\.

### Remediation<a name="secretsmanager-1-remediation"></a>

To remediate this issue, you enable automatic rotation for your secrets\.

**To enable automatic rotation for secrets**

1. Open the Secrets Manager console at [https://console\.aws\.amazon\.com/secretsmanager/](https://console.aws.amazon.com/secretsmanager/)\.

1. To find the secret that requires rotating, enter the secret name in the search field\. 

1. Choose the secret you want to rotate, which displays the secrets details page\. 

1. Under **Rotation configuration**, choose **Edit rotation**\.

1. From **Edit rotation configuration**, choose **Enable automatic rotation**\.

1. For **Select Rotation Interval**, choose a rotation interval\.

1. Choose a Lambda function for rotation\. For information about customizing your Lambda rotation function, see [Understanding and customizing your Lambda rotation function](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets-lambda-function-customizing.html) in the *AWS Secrets Manager User Guide*\.

1. To configure the secret for rotation, choose **Next**\.

To learn more about Secrets Manager rotation, see [Rotating your AWS Secrets Manager secrets](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html) in the *AWS Secrets Manager User Guide*\.

