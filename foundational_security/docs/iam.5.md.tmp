## \[IAM\.5\] MFA should be enabled for all IAM users that have a console password<a name="fsbp-iam-5"></a>

**Category:** Protect > Secure access management

**Severity:** Medium

**Resource type:** `AWS::IAM::User`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/mfa-enabled-for-iam-console-access.html](https://docs.aws.amazon.com/config/latest/developerguide/mfa-enabled-for-iam-console-access.html)

**Parameters:** None

This control checks whether AWS multi\-factor authentication \(MFA\) is enabled for all IAM users that use a console password\.

Multi\-factor authentication \(MFA\) adds an extra layer of protection on top of a user name and password\. With MFA enabled, when a user signs in to an AWS website, they are prompted for their user name and password\. In addition, they are prompted for an authentication code from their AWS MFA device\.

We recommend that you enable MFA for all accounts that have a console password\. MFA is designed to provide increased security for console access\. The authenticating principal must possess a device that emits a time\-sensitive key and must have knowledge of a credential\. 

### Remediation<a name="iam-5-remediation"></a>

To remediate this issue, add MFA to users that do not yet have it\. 

**To configure MFA for a user**

1. Open the IAM console at [https://console\.aws\.amazon\.com/iam/](https://console.aws.amazon.com/iam/)\.

1. Choose **Users**\.

1. Choose the **User name** of the user to configure MFA for\.

1. Choose **Security credentials**\.

1. Next to **Assigned MFA Device**, choose **Manage**\.

1. Follow the **Manage MFA Device** wizard to assign the type of device appropriate for your environment\. 

To learn how to delegate MFA setup to users, see the blog post [How to delegate management of multi\-factor authentication to AWS IAM users](http://aws.amazon.com/blogs/security/how-to-delegate-management-of-multi-factor-authentication-to-aws-iam-users/)\.

