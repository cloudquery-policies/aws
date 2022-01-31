## \[IAM\.4\] IAM root user access key should not exist

**Category:** Protect > Secure access management

**Severity:** Critical 

**Resource type:** AWS account

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/iam-root-access-key-check.html](https://docs.aws.amazon.com/config/latest/developerguide/iam-root-access-key-check.html)

**Parameters:** None

This control checks whether the root user access key is present\. 

The root account is the most privileged user in an AWS account\. AWS access keys provide programmatic access to a given account\.

Security Hub recommends that you remove all access keys that are associated with the root account\. This limits that vectors that can be used to compromise the account\. It also encourages the creation and use of role\-based accounts that are least privileged\. 

**Note**  
This control is not supported in Africa \(Cape Town\)\.

### Remediation<a name="iam-4-remediation"></a>

To remediate this issue, delete the root user access key\.

**To delete access keys**

1. Log in to your account using the AWS account root user credentials\.

1. Choose the account name near the top\-right corner of the page and then choose **My Security Credentials**\.

1. In the pop\-up warning, choose **Continue to Security Credentials**\. 

1. Choose **Access keys \(access key ID and secret access key\)**\. 

1. To permanently delete the key, choose **Delete** and then choose **Yes**\. You cannot recover deleted keys\.

1. If there is more than one root user access key, then repeat steps 4 and 5 for each key\.

