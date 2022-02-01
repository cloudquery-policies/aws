## \[SNS\.1\] SNS topics should be encrypted at rest using AWS KMS

**Category:** Protect > Data protection > Encryption of data at rest 

**Severity:** Medium

**Resource type:** `AWS::SNS::Topic`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/sns-encrypted-kms.html](https://docs.aws.amazon.com/config/latest/developerguide/sns-encrypted-kms.html)

**Parameters:** None

This control checks whether an SNS topic is encrypted at rest using AWS KMS\.

Encrypting data at rest reduces the risk of data stored on disk being accessed by a user not authenticated to AWS\. It also adds another set of access controls to limit the ability of unauthorized users to access the data\. For example, API permissions are required to decrypt the data before it can be read\. SNS topics should be encrypted at\-rest for an added layer of security\. For more information, see [Encryption at rest](https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html) in the *Amazon Simple Notification Service Developer Guide*\.

### Remediation<a name="sns-1-remediation"></a>

To remediate this issue, update your SNS topic to enable encryption\.

**To encrypt an unencrypted SNS topic**

1. Open the Amazon SNS console at [https://console\.aws\.amazon\.com/sns/v3/home](https://console.aws.amazon.com/sns/v3/home)\.

1. In the navigation pane, choose **Topics**\.

1. Choose the name of the topic to encrypt\.

1. Choose **Edit**\.

1. Under **Encryption**, choose **Enable Encryption**\.

1. Choose the KMS key to use to encrypt the topic\.

1. Choose **Save changes**\.

