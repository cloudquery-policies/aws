## \[DynamoDB\.2\] DynamoDB tables should have point\-in\-time recovery enabled<a name="fsbp-dynamodb-2"></a>

**Category:** Recover > Resilience > Backups enabled

**Severity:** Medium

**Resource type:** `AWS::DynamoDB::Table`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/dynamodb-pitr-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/dynamodb-pitr-enabled.html)

**Parameters:** None

This control checks whether point\-in\-time recovery \(PITR\) is enabled for an Amazon DynamoDB table\.

Backups help you to recover more quickly from a security incident\. They also strengthen the resilience of your systems\. DynamoDB point\-in\-time recovery automates backups for DynamoDB tables\. It reduces the time to recover from accidental delete or write operations\. DynamoDB tables that have PITR enabled can be restored to any point in time in the last 35 days\.

### Remediation<a name="dynamodb-2-remediation"></a>

To remediate this issue, add point\-in\-time recovery to your DynamoDB table\.

**To enable DynamoDB point\-in\-time recovery for an existing table**

1. Open the DynamoDB console at [https://console\.aws\.amazon\.com/dynamodb/](https://console.aws.amazon.com/dynamodb/)\.

1. Choose the table that you want to work with, and then choose **Backups**\. 

1. In the **Point\-in\-time Recovery** section, under **Status**, choose **Enable**\.

1. Choose **Enable** again to confirm the change\.

