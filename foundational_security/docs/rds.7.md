## \[RDS\.7\] RDS clusters should have deletion protection enabled<a name="fsbp-rds-7"></a>

**Category:** Protect > Data protection > Data deletion protection

**Severity:** Low

**Resource type:** `AWS::RDS::DBCluster`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/rds-cluster-deletion-protection-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/rds-cluster-deletion-protection-enabled.html)

**Parameters:** None

This control checks whether RDS clusters have deletion protection enabled\. 

This control is intended for RDS DB instances\. However, it can also generate findings for Aurora DB instances, Neptune DB instances, and Amazon DocumentDB clusters\. If these findings are not useful, then you can suppress them\.

Enabling cluster deletion protection is an additional layer of protection against accidental database deletion or deletion by an unauthorized entity\.

When deletion protection is enabled, an RDS cluster cannot be deleted\. Before a deletion request can succeed, deletion protection must be disabled\.

**Note**  
This control is not supported in the following Regions\.  
China \(Beijing\)
China \(Ningxia\)
Middle East \(Bahrain\)
South America \(São Paulo\)\.

### Remediation<a name="rds-7-remediation"></a>

To remediate this issue, update your RDS DB cluster to enable delete protection\.

**To enable deletion protection for an RDS DB cluster**

1. Open the Amazon RDS console at [https://console\.aws\.amazon\.com/rds/](https://console.aws.amazon.com/rds/)\.

1. In the navigation pane, choose **Databases**, then choose the DB cluster that you want to modify\. 

1. Choose **Modify**\.

1. Under **Deletion protection**, choose **Enable deletion protection**\.

1. Choose **Continue**\.

1. Under **Scheduling of modifications**, choose when to apply modifications\. The options are **Apply during the next scheduled maintenance window** or **Apply immediately**\.

1. Choose **Modify Cluster**\.

