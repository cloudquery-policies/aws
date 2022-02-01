## \[KMS\.2\] IAM principals should not have IAM inline policies that allow decryption actions on all KMS keys

**Category:** Protect > Secure access management

**Severity:** Medium

**Resource type:**
+ `AWS::IAM::Role`
+ `AWS::IAM::User`
+ `AWS::IAM::Group`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/iam-inline-policy-blocked-kms-actions.html](https://docs.aws.amazon.com/config/latest/developerguide/iam-inline-policy-blocked-kms-actions.html) 

**Parameters:**
+ `kms:ReEncryptFrom, kms:Decrypt`

Checks whether the inline policies that are embedded in your IAM identities \(role, user, or group\) allow the AWS KMS decryption actions on all KMS keys\. This control uses [Zelkova](http://aws.amazon.com/blogs/security/protect-sensitive-data-in-the-cloud-with-automated-reasoning-zelkova/), an automated reasoning engine, to validate and warn you about policies that may grant broad access to your secrets across AWS accounts\.

This control fails if the policy is open enough to allow `kms:Decrypt` or `kms:ReEncryptFrom` actions on any arbitrary KMS key\.

With AWS KMS, you control who can use your KMS keys and gain access to your encrypted data\. IAM policies define which actions an identity \(user, group, or role\) can perform on which resources\. Following security best practices, AWS recommends that you allow least privilege\. In other words, you should grant to identities only the permissions they need and only for keys that are required to perform a task\. Otherwise, the user might use keys that are not appropriate for your data\.

Instead of granting permission for all keys, determine the minimum set of keys that users need to access encrypted data\. Then design policies that allow the users to use only those keys\. For example, do not allow `kms:Decrypt` permission on all KMS keys\. Instead, allow the permission only on specific keys in a specific Region for your account\. By adopting the principle of least privilege, you can reduce the risk of unintended disclosure of your data\.

### Remediation<a name="kms-2-remediation"></a>

To remediate this issue, you modify the inline policy to restrict access to the keys\.

**To modify an IAM inline policy**

1. Open the IAM console at [https://console\.aws\.amazon\.com/iam/](https://console.aws.amazon.com/iam/)\.

1. In the IAM navigation pane, choose **Users**, **Groups**, or **Roles**\. 

1. Choose the name of the user, group or role for which to modify IAM inline policies\. 

1. Choose the arrow next to the policy to modify\.

1. Choose **Edit policy**\.

1. Choose the **JSON** tab\.

1. Change the `"Resource"` value to the specific keys you want to allow\.

1. After you modify the policy, choose **Review policy**\.

1. Choose **Save changes**\.

For more information, see [Using IAM policies with AWS KMS](https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies.html) in the *AWS Key Management Service Developer Guide*\.

