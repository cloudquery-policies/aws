## \[RDS\.16\] RDS DB clusters should be configured to copy tags to snapshots

**Category:** Identify > Inventory

**Severity:** Low

**Resource type:** `AWS::RDS::DBCluster`

**AWS Config rule:** `rds-cluster-copy-tags-to-snapshots-enabled` \(Custom rule developed by Security Hub\)

**Parameters:** None

This control checks whether RDS DB clusters are configured to copy all tags to snapshots when the snapshots are created\.

Identification and inventory of your IT assets is a crucial aspect of governance and security\. You need to have visibility of all your RDS DB clusters so that you can assess their security posture and take action on potential areas of weakness\. Snapshots should be tagged in the same way as their parent RDS database clusters\. Enabling this setting ensures that snapshots inherit the tags of their parent database clusters\.

**Note**  
This control is not supported in the following Regions:  
China \(Beijing\)
Middle East \(Bahrain\)
South America \(São Paulo\)

### Remediation<a name="rds-16-remediation"></a>

**To enable automatic tag copying to snapshots for a DB cluster**

1. Open the Amazon RDS console at [https://console\.aws\.amazon\.com/rds/](https://console.aws.amazon.com/rds/)\.

1. Choose **Databases**\.

1. Select the DB cluster to modify\.

1. Choose **Modify**\.

1. Under **Backup**, select **Copy tags to snapshots**\.

1. Choose **Continue**\.

1. Under **Scheduling of modifications**, choose when to apply modifications\. You can choose either **Apply during the next scheduled maintenance window** or **Apply immediately**\.

