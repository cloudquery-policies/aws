## \[KMS\.3\] AWS KMS keys should not be unintentionally deleted

**Category:** Protect > Data protection > Data deletion protection

**Severity:** Critical

**Resource type:** `AWS::KMS::Key`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/kms-cmk-not-scheduled-for-deletion.html](https://docs.aws.amazon.com/config/latest/developerguide/kms-cmk-not-scheduled-for-deletion.html)

**Parameters:** None

This control checks whether KMS keys are scheduled for deletion\. The control fails if a KMS key is scheduled for deletion\.

KMS keys cannot be recovered once deleted\. Data encrypted under a KMS key is also permanently unrecoverable if the KMS key is deleted\. If meaningful data has been encrypted under a KMS key scheduled for deletion, consider decrypting the data or re\-encrypting the data under a new KMS key unless you are intentionally performing a *cryptographic erasure*\.

When a KMS key is scheduled for deletion, a mandatory waiting period is enforced to allow time to reverse the deletion, if it was scheduled in error\. The default waiting period is 30 days, but it can be reduced to as short as 7 days when the KMS key is scheduled for deletion\. During the waiting period, the scheduled deletion can be canceled and the KMS key will not be deleted\.

For additional information regarding deleting KMS keys, see [Deleting KMS keys](https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html) in the *AWS Key Management Service Developer Guide*\.

**Note**  
This control is not supported in the Asia Pacific \(Osaka\) and Europe \(Milan\) Regions\.

### Remediation<a name="kms-3-remediation"></a>

For detailed remediation instructions to cancel a scheduled KMS key deletion, see **To cancel key deletion** under [Scheduling and canceling key deletion \(console\)](https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html#deleting-keys-scheduling-key-deletion) in the AWS Key Management Service Developer Guide\. 

