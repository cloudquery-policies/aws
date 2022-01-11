## \[RDS\.23\] RDS databases and clusters should not use a database engine default port<a name="fsbp-rds-23"></a>

**Category:** Protect > Secure network configuration

**Severity:** Low

**Resource type:** `AWS::RDS::DBInstance`

**AWS Config rule:** `rds-no-default-ports` \(Custom rule developed by Security Hub\)

**Parameters:** None

This control checks whether the RDS cluster or instance uses a port other than the default port of the database engine\.

If you use a known port to deploy an RDS cluster or instance, an attacker can guess information about the cluster or instance\. The attacker can use this information in conjunction with other information to connect to an RDS cluster or instance or gain additional information about your application\.

When you change the port, you must also update the existing connection strings that were used to connect to the old port\. You should also check the security group of the DB instance to ensure that it includes an ingress rule that allows connectivity on the new port\.

### Remediation<a name="rds-23-remediation"></a>

**To modify the default port of an existing DB instance**

1. Open the Amazon RDS console at [https://console\.aws\.amazon\.com/rds/](https://console.aws.amazon.com/rds/)\.

1. Choose **Databases**\.

1. Select the DB instance to modify

1. Choose **Modify**\.

1. Under **Database options**, change **Database port** to a non\-default value\.

1. Choose **Continue**\.

1. Under **Scheduling of modifications**, choose when to apply modifications\. You can choose either **Apply during the next scheduled maintenance window** or **Apply immediately**\.

1. For clusters, choose **Modify cluster**\. For instances, choose **Modify DB Instance**\.

