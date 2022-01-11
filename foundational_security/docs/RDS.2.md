## \[RDS\.2\] RDS DB instances should prohibit public access, determined by the PubliclyAccessible configuration<a name="fsbp-rds-2"></a>

**Category:** Protect > Secure network configuration

**Severity:** Critical

**Resource type:** `AWS::RDS::DBInstance`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/rds-instance-public-access-check.html](https://docs.aws.amazon.com/config/latest/developerguide/rds-instance-public-access-check.html)

**Parameters:** None

This control checks whether Amazon RDS instances are publicly accessible by evaluating the `PubliclyAccessible` field in the instance configuration item\.

Neptune DB instances and Amazon DocumentDB clusters do not have the `PubliclyAccessible` flag and cannot be evaluated\. However, this control can still generate findings for these resources\. You can suppress these findings\.

The `PubliclyAccessible` value in the RDS instance configuration indicates whether the DB instance is publicly accessible\. When the DB instance is configured with `PubliclyAccessible`, it is an Internet\-facing instance with a publicly resolvable DNS name, which resolves to a public IP address\. When the DB instance isn't publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address\.

Unless you intend for your RDS instance to be publicly accessible, the RDS instance should not be configured with `PubliclyAccessible` value\. Doing so might allow unnecessary traffic to your database instance\.

### Remediation<a name="rds-2-remediation"></a>

To remediate this issue, update your RDS DB instances to remove public access\.

**To remove public access from RDS DB instances**

1. Open the Amazon RDS console at [https://console\.aws\.amazon\.com/rds/](https://console.aws.amazon.com/rds/)\.

1. Navigate to **Databases** and then choose your public database\.

1. Choose **Modify**\.

1. Under **Connectivity**, expand **Additional connectivity configuration**\.

1. Under **Public access**, choose **Not publicly accessible**\.

1. Choose **Continue**\.

1. Under **Scheduling of modifications**, choose **Apply immediately**\.

1. Choose **Modify DB Instance**\.

For more information, see [Working with a DB instance in a VPC](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_VPC.WorkingWithRDSInstanceinaVPC.html) in the *Amazon RDS User Guide*\.

