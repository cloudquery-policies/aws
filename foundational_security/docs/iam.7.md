## \[IAM\.7\] Password policies for IAM users should have strong configurations

**Category:** Protect > Secure access management

**Severity:** Medium

**Resource type:** AWS account

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/iam-password-policy.html](https://docs.aws.amazon.com/config/latest/developerguide/iam-password-policy.html)

**Parameters:**
+ `RequireUppercaseCharacters`: `true`
+ `RequireLowercaseCharacters`: `true`
+ `RequireSymbols`: `true`
+ `RequireNumbers`: `true`
+ `MinimumPasswordLength`: `8`

This control checks whether the account password policy for IAM users uses the following recommended configurations\.
+ `RequireUppercaseCharacters`: `true`
+ `RequireLowercaseCharacters`: `true`
+ `RequireSymbols`: `true`
+ `RequireNumbers`: `true`
+ `MinimumPasswordLength`: `8`

To access the AWS Management Console, IAM users need passwords\. As a best practice, Security Hub highly recommends that instead of creating IAM users, you use federation\. Federation allows users to use their existing corporate credentials to log into the AWS Management Console\. Use AWS Single Sign\-On \(AWS SSO\) to create or federate the user, and then assume an IAM role into an account\.

To learn more about identity providers and federation, see [Identity providers and federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers.html) in the *IAM User Guide*\. To learn more about AWS SSO, see the [https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html)\.

 If you need to use IAM users, Security Hub recommends that you enforce the creation of strong user passwords\. You can set a password policy on your AWS account to specify complexity requirements and mandatory rotation periods for passwords\. When you create or change a password policy, most of the password policy settings are enforced the next time users change their passwords\. Some of the settings are enforced immediately\. To learn more, see [Setting an account password policy for IAM users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_passwords_account-policy.html) in the *IAM User Guide*\.

### Remediation<a name="iam-7-remediation"></a>

To remediate this issue, update your password policy to use the recommended configuration\.

**To modify the password policy**

1. Open the IAM console at [https://console\.aws\.amazon\.com/iam/](https://console.aws.amazon.com/iam/)\.

1. Choose **Account settings**\.

1. Select **Requires at least one uppercase letter**\.

1. Select **Requires at least one lowercase letter**\.

1. Select **Requires at least one non\-alphanumeric character**\.

1. Select **Requires at least one number**\.

1. For **Minimum password length**, enter **8**\.

1. Choose **Apply password policy**\.

