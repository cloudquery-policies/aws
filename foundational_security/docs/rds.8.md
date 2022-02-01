## \[RDS\.8\] RDS DB instances should have deletion protection enabled

**Category: **Protect > Data protection > Data deletion protection

**Severity:** Low

**Resource type:** `AWS::RDS::DBInstance`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/rds-instance-deletion-protection-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/rds-instance-deletion-protection-enabled.html)

**Parameters:**
+ `databaseEngines`: `mariadb,mysql,oracle-ee,oracle-se2,oracle-se1,oracle-se,postgres,sqlserver-ee,sqlserver-se,sqlserver-ex,sqlserver-web`

This control checks whether your RDS DB instances that use one of the listed database engines have deletion protection enabled\.

Enabling instance deletion protection is an additional layer of protection against accidental database deletion or deletion by an unauthorized entity\.

While deletion protection is enabled, an RDS DB instance cannot be deleted\. Before a deletion request can succeed, deletion protection must be disabled\.

### Remediation<a name="rds-8-remediation"></a>

To remediate this issue, update your RDS DB instance to enable deletion protection\.

**To enable deletion protection for an RDS DB instance**

1. Open the Amazon RDS console at [https://console\.aws\.amazon\.com/rds/](https://console.aws.amazon.com/rds/)\.

1. In the navigation pane, choose **Databases**, then choose the DB instance that you want to modify\. 

1. Choose **Modify**\.

1. Under **Deletion protection**, choose **Enable deletion protection**\.

1. Choose **Continue**\.

1. Under **Scheduling of modifications**, choose when to apply modifications\. The options are **Apply during the next scheduled maintenance window** or **Apply immediately**\.

1. Choose **Modify DB Instance**\.

