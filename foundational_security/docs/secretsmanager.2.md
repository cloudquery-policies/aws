## \[SecretsManager\.2\] Secrets Manager secrets configured with automatic rotation should rotate successfully

**Category:** Protect > Secure development

**Severity:** Medium

**Resource type:** `AWS::SecretsManager::Secret`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/secretsmanager-scheduled-rotation-success-check.html](https://docs.aws.amazon.com/config/latest/developerguide/secretsmanager-scheduled-rotation-success-check.html)

**Parameters:** None

This control checks whether an AWS Secrets Manager secret rotated successfully based on the rotation schedule\. The control fails if `RotationOccurringAsScheduled` is `false`\. The control does not evaluate secrets that do not have rotation configured\.

Secrets Manager helps you improve the security posture of your organization\. Secrets include database credentials, passwords, and third\-party API keys\. You can use Secrets Manager to store secrets centrally, encrypt secrets automatically, control access to secrets, and rotate secrets safely and automatically\.

Secrets Manager can rotate secrets\. You can use rotation to replace long\-term secrets with short\-term ones\. Rotating your secrets limits how long an unauthorized user can use a compromised secret\. For this reason, you should rotate your secrets frequently\.

In addition to configuring secrets to rotate automatically, you should ensure that those secrets rotate successfully based on the rotation schedule\.

To learn more about rotation, see [Rotating your AWS Secrets Manager secrets](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html) in the *AWS Secrets Manager User Guide*\.

### Remediation<a name="secretsmanager-2-remediation"></a>

If the automatic rotation fails, then Secrets Manager might have encountered errors with the configuration\. 

To rotate secrets in Secrets Manager, you use a Lambda function that defines how to interact with the database or service that owns the secret\. 

For help on how to diagnose and fix common errors related to secrets rotation, see [Troubleshooting AWS Secrets Manager rotation of secrets](https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot_rotation.html) in the *AWS Secrets Manager User Guide*\.

