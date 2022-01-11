## \[EFS\.1\] Amazon EFS should be configured to encrypt file data at rest using AWS KMS<a name="fsbp-efs-1"></a>

**Category:** Protect > Data protection > Encryption of data at rest

**Severity:** Medium

**Resource type:** `AWS::EFS::FileSystem`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/efs-encrypted-check.html](https://docs.aws.amazon.com/config/latest/developerguide/efs-encrypted-check.html)

**Parameters:** None

This control checks whether Amazon Elastic File System is configured to encrypt the file data using AWS KMS\. The check fails in the following cases\.
+ `Encrypted` is set to `false` in the [https://docs.aws.amazon.com/efs/latest/ug/API_DescribeFileSystems.html](https://docs.aws.amazon.com/efs/latest/ug/API_DescribeFileSystems.html) response\.
+ The `KmsKeyId` key in the [https://docs.aws.amazon.com/efs/latest/ug/API_DescribeFileSystems.html](https://docs.aws.amazon.com/efs/latest/ug/API_DescribeFileSystems.html) response does not match the `KmsKeyId` parameter for [https://docs.aws.amazon.com/config/latest/developerguide/efs-encrypted-check.html](https://docs.aws.amazon.com/config/latest/developerguide/efs-encrypted-check.html)\.

Note that this control does not use the `KmsKeyId` parameter for [https://docs.aws.amazon.com/config/latest/developerguide/efs-encrypted-check.html](https://docs.aws.amazon.com/config/latest/developerguide/efs-encrypted-check.html)\. It only checks the value of `Encrypted`\.

For an added layer of security for your sensitive data in Amazon EFS, you should create encrypted file systems\. Amazon EFS supports encryption for file systems at\-rest\. You can enable encryption of data at rest when you create an Amazon EFS file system\. To learn more about Amazon EFS encryption, see[ Data encryption in Amazon EFS](https://docs.aws.amazon.com/efs/latest/ug/encryption.html) in the *Amazon Elastic File System User Guide*\.

**Note**  
This control is not supported in Africa \(Cape Town\) or Europe \(Milan\)\.

### Remediation<a name="efs-1-remediation"></a>

For details on how to encrypt a new Amazon EFS file system, see [Encrypting data at rest](https://docs.aws.amazon.com/efs/latest/ug/encryption-at-rest.html) in the *Amazon Elastic File System User Guide*\.

