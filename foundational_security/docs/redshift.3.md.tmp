## \[Redshift\.3\] Amazon Redshift clusters should have automatic snapshots enabled<a name="fsbp-redshift-3"></a>

**Category:** Recover > Resilience > Backups enabled 

**Severity:** Medium

**Resource type:** `AWS::Redshift::Cluster`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/redshift-backup-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/redshift-backup-enabled.html)

**Parameters:**
+ `MinRetentionPeriod = 7`

This control checks whether Amazon Redshift clusters have automated snapshots enabled\. It also checks whether the snapshot retention period is greater than or equal to seven\.

Backups help you to recover more quickly from a security incident\. They strengthen the resilience of your systems\. Amazon Redshift takes periodic snapshots by default\. This control checks whether automatic snapshots are enabled and retained for at least seven days\. For more details on Amazon Redshift automated snapshots, see [Automated snapshots](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html#about-automated-snapshots) in the *Amazon Redshift Cluster Management Guide*\.

**Note**  
This control is not supported in the following Regions:  
Africa \(Cape Town\)
Asia Pacific \(Osaka\)
Asia Pacific \(Sydney\)
China \(Ningxia\)
Europe \(Milan\)

### Remediation<a name="redshift-3-remediation"></a>

To remediate this issue, update the snapshot retention period to at least 7\.

**To modify the snapshot retention period**

1. Open the Amazon Redshift console at [https://console\.aws\.amazon\.com/redshift/](https://console.aws.amazon.com/redshift/)\.

1. In the navigation menu, choose **Clusters**, then choose the name of the cluster to modify\.

1. Choose **Edit**\.

1. Under **Backup**, set **Snapshot retention** to a value of 7 or greater\.

1. Choose **Modify Cluster**\.

