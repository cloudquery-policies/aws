## \[RDS\.17\] RDS DB instances should be configured to copy tags to snapshots

**Category:** Identify > Inventory

**Severity:** Low

**Resource type:** `AWS::RDS::DBInstance`

**AWS Config rule:** `rds-instance-copy-tags-to-snapshots-enabled` \(Custom rule developed by Security Hub\)

**Parameters:** None

This control checks whether RDS DB instances are configured to copy all tags to snapshots when the snapshots are created\.

Identification and inventory of your IT assets is a crucial aspect of governance and security\. You need to have visibility of all your RDS DB instances so that you can assess their security posture and take action on potential areas of weakness\. Snapshots should be tagged in the same way as their parent RDS database instances\. Enabling this setting ensures that snapshots inherit the tags of their parent database instances\.

### Remediation<a name="rds-17-remediation"></a>

**To enable automatic tag copying to snapshots for a DB instance**

1. Open the Amazon RDS console at [https://console\.aws\.amazon\.com/rds/](https://console.aws.amazon.com/rds/)\.

1. Choose **Databases**\.

1. Select the DB instance to modify\.

1. Choose **Modify**\.

1. Under **Backup**, select **Copy tags to snapshots**\.

1. Choose **Continue**\.

1. Under **Scheduling of modifications**, choose when to apply modifications\. You can choose either** Apply during the next scheduled maintenance window** or **Apply immediately**\.

