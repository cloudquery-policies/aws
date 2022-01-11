## \[RDS\.5\] RDS DB instances should be configured with multiple Availability Zones<a name="fsbp-rds-5"></a>

**Category:** Recover > Resilience > High availability

**Severity:** Medium

**Resource type:** `AWS::RDS::DBInstance`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/rds-multi-az-support.html](https://docs.aws.amazon.com/config/latest/developerguide/rds-multi-az-support.html)

**Parameters:** None

This control checks whether high availability is enabled for your RDS DB instances\.

RDS DB instances should be configured for multiple Availability Zones \(AZs\)\. This ensures the availability of the data stored\. Multi\-AZ deployments allow for automated failover if there is an issue with Availability Zone availability and during regular RDS maintenance\.

### Remediation<a name="rds-5-remediation"></a>

To remediate this issue, update your DB instances to enable multiple Availability Zones\.

**To enable multiple Availability Zones for a DB instance**

1. Open the Amazon RDS console at [https://console\.aws\.amazon\.com/rds/](https://console.aws.amazon.com/rds/)\.

1. In the navigation pane, choose **Databases**, and then choose the DB instance that you want to modify\. 

1. Choose **Modify**\. The **Modify DB Instance** page appears\. 

1. Under **Instance Specifications**, set **Multi\-AZ deployment** to **Yes**\.

1. Choose **Continue** and then check the summary of modifications\. 

1. \(Optional\) Choose **Apply immediately** to apply the changes immediately\. Choosing this option can cause an outage in some cases\. For more information, see [Using the Apply Immediately setting](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.DBInstance.Modifying.html#USER_ModifyInstance.ApplyImmediately) in the *Amazon RDS User Guide*\.

1. On the confirmation page, review your changes\. If they are correct, choose **Modify DB Instance** to save your changes\.

