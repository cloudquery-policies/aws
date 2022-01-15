## \[CloudTrail\.2\] CloudTrail should have encryption at rest enabled<a name="fsbp-cloudtrail-2"></a>

**Category:** Protect > Data protection > Encryption of data at rest

**Severity:** Medium

**Resource type:** `AWS::CloudTrail::Trail`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/cloud-trail-encryption-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/cloud-trail-encryption-enabled.html)

**Parameters:** None

This control checks whether CloudTrail is configured to use the server\-side encryption \(SSE\) AWS KMS key encryption\. The check passes if the `KmsKeyId` is defined\.

For an added layer of security for your sensitive CloudTrail log files, you should use [server\-side encryption with AWS KMS–managed keys \(SSE\-KMS\)](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html) for your CloudTrail log files for encryption at rest\. Note that by default, the log files delivered by CloudTrail to your buckets are encrypted by [Amazon server\-side encryption with Amazon S3\-managed encryption keys \(SSE\-S3\)](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingServerSideEncryption.html)\. 

### Remediation<a name="cloudtrail-2-remediation"></a>

To remediate this issue, update your trail to enable SSE\-KMS encryption for the log files\.

**To enable encryption for CloudTrail logs**

1. Open the CloudTrail console at [https://console\.aws\.amazon\.com/cloudtrail/](https://console.aws.amazon.com/cloudtrail/)\.

1. Choose **Trails**\.

1. Choose the trail to update\.

1. Under **General details**, choose **Edit**\.

1. For **Log file SSE\-KMS encryption**, select **Enabled**\.

1. For **Create a new KMS key**, do one of the following:
   + To create a key, choose **New**\. Then in **AWS KMS alias**, enter an alias for the key\. The key is created in the same Region as the S3 bucket\.
   + To use an existing key, choose **Existing**, then from **AWS KMS alias**, choose the key\.

     The AWS KMS key and S3 bucket must be in the same Region\.

1. Choose **Save**\.

   You might need to modify the policy for CloudTrail to successfully interact with your KMS key\. For more information, see [Encrypting CloudTrail log files with AWS KMS–managed keys \(SSE\-KMS\)](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/encrypting-cloudtrail-log-files-with-aws-kms.html) in the *AWS CloudTrail User Guide*\.

