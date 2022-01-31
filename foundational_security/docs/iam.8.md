## \[IAM\.8\] Unused IAM user credentials should be removed

**Category:** Protect > Secure access management 

**Severity:** Medium 

**Resource type:** `AWS::IAM::User`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/iam-user-unused-credentials-check.html](https://docs.aws.amazon.com/config/latest/developerguide/iam-user-unused-credentials-check.html)

**Parameters:**
+ `maxCredentialUsageAge`: 90 

This control checks whether your IAM users have passwords or active access keys that have not been used for 90 days\.

IAM users can access AWS resources using different types of credentials, such as passwords or access keys\. 

Security Hub recommends that you remove or deactivate all credentials that were unused for 90 days or more\. Disabling or removing unnecessary credentials reduces the window of opportunity for credentials associated with a compromised or abandoned account to be used\.

### Remediation<a name="iam-8-remediation"></a>

To get some of the information that you need to monitor accounts for dated credentials, use the IAM console\. For example, when you view users in your account, there is a column for **Access key age**, **Password age**, and **Last activity**\. If the value in any of these columns is greater than 90 days, make the credentials for those users inactive\.

You can also use credential reports to monitor user accounts and identify those with no activity for 90 or more days\. You can download credential reports in `.csv` format from the IAM console\. For more information about credential reports, see [Getting credential reports for your AWS account](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_getting-report.html#getting-credential-reports-console) in the *IAM User Guide*\.

After you identify the inactive accounts or unused credentials, use the following steps to disable them\.

**To disable credentials for inactive accounts**

1. Open the IAM console at [https://console\.aws\.amazon\.com/iam/](https://console.aws.amazon.com/iam/)\.

1. Choose **Users**\.

1. Choose the name of the user that has credentials over 90 days old\.

1. Choose** Security credentials**\.

1. For each sign\-in credential and access key that hasn't been used in at least 90 days, choose **Make inactive**\.

