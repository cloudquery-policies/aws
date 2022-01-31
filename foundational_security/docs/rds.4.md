## \[RDS\.4\] RDS cluster snapshots and database snapshots should be encrypted at rest

**Category:** Protect > Data protection > Encryption of data at rest

**Severity:** Medium

**Resource type:** `AWS::RDS::DBClusterSnapshot`,` AWS::RDS::DBSnapshot`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/rds-snapshot-encrypted.html](https://docs.aws.amazon.com/config/latest/developerguide/rds-snapshot-encrypted.html)

**Parameters:** None

This control checks whether RDS DB snapshots are encrypted\.

This control is intended for RDS DB instances\. However, it can also generate findings for snapshots of Aurora DB instances, Neptune DB instances, and Amazon DocumentDB clusters\. If these findings are not useful, then you can suppress them\.

Encrypting data at rest reduces the risk that an unauthenticated user gets access to data that is stored on disk\. Data in RDS snapshots should be encrypted at rest for an added layer of security\.

### Remediation<a name="rds-4-remediation"></a>

You can use the Amazon RDS console to remediate this issue\.

**To encrypt an unencrypted RDS snapshot**

1. Open the Amazon RDS console at [https://console\.aws\.amazon\.com/rds/](https://console.aws.amazon.com/rds/)\.

1. In the navigation pane, choose **Snapshots**\.

1. Find the snapshot to encrypt under **Manual** or **System**\.

1. Select the check box next to the snapshot to encrypt\.

1. Choose **Actions**, then choose **Copy Snapshot**\.

1. Under **New DB Snapshot Identifier**, type a name for the new snapshot\.

1. Under **Encryption**, select **Enable Encryption**\.

1. Choose the KMS key to use to encrypt the snapshot\.

1. Choose **Copy Snapshot**\.

1. After the new snapshot is created, delete the original snapshot\.

1. For **Backup Retention Period**, choose a positive nonzero value\. For example, 30 days\.

