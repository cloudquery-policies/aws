## \[IAM\.3\] IAM users' access keys should be rotated every 90 days or less

**Category:** Protect > Secure access management

**Severity:** Medium 

**Resource type:** `AWS::IAM::User`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/access-keys-rotated.html](https://docs.aws.amazon.com/config/latest/developerguide/access-keys-rotated.html)

**Parameters:**
+ `maxAccessKeyAge`: 90

This control checks whether the active access keys are rotated within 90 days\.

We highly recommend that you do not generate and remove all access keys in your account\. Instead, the recommended best practice is to either create one or more IAM roles or to use [federation](http://aws.amazon.com/identity/federation/)\. You can use these methods to allow your users to use their existing corporate credentials to log into the AWS Management Console and AWS CLI\.

Each approach has its use cases\. Federation is generally better for enterprises that have an existing central directory or plan to need more than the current limit IAM users\. Applications that run outside of an AWS environment need access keys for programmatic access to AWS resources\.

However, if the resources that need programmatic access run inside AWS, the best practice is to use IAM roles\. Roles allow you to grant a resource access without hardcoding an access key ID and secret access key into the configuration\.

To learn more about protecting your access keys and account, see [Best practices for managing AWS access keys](https://docs.aws.amazon.com/general/latest/gr/aws-access-keys-best-practices.html) in the *AWS General Reference*\. Also see the blog post [Guidelines for protecting your AWS account while using programmatic access](http://aws.amazon.com/blogs/security/guidelines-for-protecting-your-aws-account-while-using-programmatic-access/)\.

If you already have an access key, Security Hub recommends that you rotate the access keys every 90 days\. Rotating access keys reduces the chance that an access key that is associated with a compromised or terminated account is used\. It also ensures that data cannot be accessed with an old key that might have been lost, cracked, or stolen\. Always update your applications after you rotate access keys\. 

Access keys consist of an access key ID and a secret access key\. They are used to sign programmatic requests that you make to AWS\. AWS users need their own access keys to make programmatic calls to AWS from the AWS CLI, Tools for Windows PowerShell, the AWS SDKs, or direct HTTP calls using the API operations for individual AWS services\.

If your organization uses AWS Single Sign\-On \(AWS SSO\), your users can sign in to Active Directory, a built\-in AWS SSO directory, or [another identity provider \(IdP\) connected to AWS SSO](https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-identity-source-idp.html)\. They can then be mapped to an IAM role that enables them to run AWS CLI commands or call AWS API operations without the need for IAM user access keys\. To learn more, see [Configuring the AWS CLI to use AWS Single Sign\-On](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html) in the *AWS Command Line Interface User Guide*\.

**Note**  
This control is not supported in Africa \(Cape Town\) or Europe \(Milan\)\.

### Remediation<a name="iam-3-remediation"></a>

To remediate this issue, replace any keys that are older than 90 days\.

**To ensure that access keys aren't more than 90 days old**

1. Open the IAM console at [https://console\.aws\.amazon\.com/iam/](https://console.aws.amazon.com/iam/)\.

1. Choose **Users**\.

1. For each user that shows an **Access key age** that is greater than 90 days, choose the **User name** to open the settings for that user\.

1. Choose **Security credentials**\.

1. Create a new key for the user:

   1. Choose **Create access key**\.

   1. To save the key content, either download the secret access key, or choose **Show** and then copy it from the page\.

   1. Store the key in a secure location to provide to the user\.

   1. Choose **Close**\.

1. Update all applications that were using the previous key to use the new key\.

1. For the previous key, choose **Make inactive** to make the access key inactive\. The user now cannot use that key to make requests\.

1. Confirm that all applications work as expected with the new key\.

1. After confirming that all applications work with the new key, delete the previous key\. After you delete the access key, you cannot recover it\.

   To delete the previous key, choose the **X** at the end of the row and then choose **Delete**\.

