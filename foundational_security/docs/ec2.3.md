## \[EC2\.3\] Attached EBS volumes should be encrypted at rest

**Category:** Protect > Data protection > Encryption of data at rest

**Severity:** Medium

**Resource type:** `AWS::EC2::Volume`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/encrypted-volumes.html](https://docs.aws.amazon.com/config/latest/developerguide/encrypted-volumes.html)

**Parameters:** None

This control checks whether the EBS volumes that are in an attached state are encrypted\. To pass this check, EBS volumes must be in use and encrypted\. If the EBS volume is not attached, then it is not subject to this check\.

For an added layer of security of your sensitive data in EBS volumes, you should enable EBS encryption at rest\. Amazon EBS encryption offers a straightforward encryption solution for your EBS resources that doesn't require you to build, maintain, and secure your own key management infrastructure\. It uses KMS keys when creating encrypted volumes and snapshots\.

To learn more about Amazon EBS encryption, see [Amazon EBS encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) in the *Amazon EC2 User Guide for Linux Instances*\.

**Note**  
This control is not supported in Africa \(Cape Town\) or Europe \(Milan\)\.

### Remediation<a name="ec2-3-remediation"></a>

There is no direct way to encrypt an existing unencrypted volume or snapshot\. You can only encrypt a new volume or snapshot when you create it\.

If you enabled encryption by default, Amazon EBS encrypts the resulting new volume or snapshot using your default key for Amazon EBS encryption\. Even if you have not enabled encryption by default, you can enable encryption when you create an individual volume or snapshot\. In both cases, you can override the default key for Amazon EBS encryption and choose a symmetric customer managed key\.

For more information, see [Creating an Amazon EBS volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-volume.html) and [Copying an Amazon EBS snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-copy-snapshot.html) in the *Amazon EC2 User Guide for Linux Instances*\.

