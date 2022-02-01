## \[DynamoDB\.3\] DynamoDB Accelerator \(DAX\) clusters should be encrypted at rest

**Category:** Protect > Data protection > Encryption of data at rest 

**Severity:** Medium

**Resource type:** `AWS::DAX::Cluster`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/dax-encryption-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/dax-encryption-enabled.html)

**Parameters:** None

This control checks whether a DAX cluster is encrypted at rest\. 

Encrypting data at rest reduces the risk of data stored on disk being accessed by a user not authenticated to AWS\. The encryption adds another set of access controls to limit the ability of unauthorized users to access to the data\. For example, API permissions are required to decrypt the data before it can be read\.

### Remediation<a name="dynamodb-3-remediation"></a>

You cannot enable or disable encryption at rest after a cluster is created\. You must recreate the cluster in order to enable encryption at rest\. For detailed instructions on how to create a DAX cluster with encryption at rest enabled, see[ Enabling encryption at rest using the AWS Management Console](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAXEncryptionAtRest.html#dax.encryption.tutorial-console) in the *Amazon DynamoDB Developer Guide*\.

