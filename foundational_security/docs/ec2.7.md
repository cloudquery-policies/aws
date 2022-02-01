## \[EC2\.7\] EBS default encryption should be enabled

**Category:** Protect > Data protection > Encryption of data at rest 

**Severity:** Medium

**Resource type:** AWS account

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/ec2-ebs-encryption-by-default.html](https://docs.aws.amazon.com/config/latest/developerguide/ec2-ebs-encryption-by-default.html)

**Parameters:** None

This control checks whether account\-level encryption is enabled by default for Amazon Elastic Block Store\(Amazon EBS\)\. The control fails if the account level encryption is not enabled\. 

When encryption is enabled for your account, Amazon EBS volumes and snapshot copies are encrypted at rest\. This adds an additional layer of protection for your data\. For more information, see [Encryption by default](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#encryption-by-default) in the *Amazon EC2 User Guide for Linux Instances*\.

Note that following instance types do not support encryption: R1, C1, and M1\.

### Remediation<a name="ec2-7-remediation"></a>

You can use the Amazon EC2 console to enable default encryption for Amazon EBS volumes\.

**To configure the default encryption for Amazon EBS encryption for a Region**

1. Open the Amazon EC2 console at [https://console\.aws\.amazon\.com/ec2/](https://console.aws.amazon.com/ec2/)\.

1. From the navigation pane, select **EC2 Dashboard**\.

1. In the upper\-right corner of the page, choose **Account Attributes, EBS encryption**\.

1. Choose **Manage**\.

1. Select **Enable**\. You can keep the AWS managed key with the alias `alias/aws/ebs` created on your behalf as the default encryption key, or choose a symmetric customer managed key\.

1. Choose **Update EBS encryption**\.

