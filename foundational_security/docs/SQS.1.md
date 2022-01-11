## \[SQS\.1\] Amazon SQS queues should be encrypted at rest<a name="fsbp-sqs-1"></a>

**Category:** Protect > Data protection > Encryption of data at rest

**Severity:** Medium

**Resource type:** `AWS::SQS::Queue`

**AWS Config rule:** `sqs-queue-encrypted` \(Custom rule developed by Security Hub\)

**Parameters:**
+ `KmsKeyAliasList` \(Optional\)\. Security Hub does not populate this parameter\. Comma\-separated list of customer\-managed AWS KMS key aliases that are used to encrypt queues\.

  For example: "`alias/myKey`"\.

  This rule is `NON_COMPLIANT` if the key used to encrypt a queue is not specified in this parameter list\.

This control checks whether Amazon SQS queues are encrypted at rest\.

Server\-side encryption \(SSE\) allows you to transmit sensitive data in encrypted queues\. To protect the content of messages in queues, SSE uses keys managed in AWS KMS\. For more information, see [Encryption at rest](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html) in the *Amazon Simple Queue Service Developer Guide*\.

### Remediation<a name="sqs-1-remediation"></a>

For information about managing SSE using the AWS Management Console, see[ Configuring server\-side encryption \(SSE\) for a queue \(console\)](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html) in the *Amazon Simple Queue Service Developer Guide*\.

