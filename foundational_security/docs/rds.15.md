## \[RDS\.15\] RDS DB clusters should be configured for multiple Availability Zones

**Category:** Recover > Resilience > High availability

**Severity:** Medium

**Resource type:** `AWS::RDS::DBCluster`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/rds-cluster-multi-az-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/rds-cluster-multi-az-enabled.html)

**Parameters:** None

This control checks whether high availability is enabled for your RDS DB clusters\.

RDS DB clusters should be configured for multiple Availability Zones to ensure availability of the data that is stored\. Deployment to multiple Availability Zones allows for automated failover in the event of an Availability Zone availability issue and during regular RDS maintenance events\.

**Note**  
This control is not supported in the following Regions:  
Asia Pacific \(Osaka\)
China \(Beijing\)
China \(Ningxia\)
Middle East \(Bahrain\)
South America \(São Paulo\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="rds-15-remediation"></a>

To remediate this control, configure your DB cluster for multiple Availability Zones\.

**To enable multi\-AZ for a DB cluster**

1. Open the Amazon RDS console at [https://console\.aws\.amazon\.com/rds/](https://console.aws.amazon.com/rds/)\.

1. In the navigation pane, choose **Databases**, and then choose the DB instance to modify\. 

1. Choose **Modify**\. The **Modify DB Instance** page appears\.

1. Under **Instance Specifications**, set **Multi\-AZ deployment** to **Yes**\.

1. Choose **Continue** and check the summary of modifications\.

1. \(Optional\) Choose **Apply immediately** to apply the changes immediately\. Choosing this option can cause an outage in some cases\. For more information, see [Using the Apply Immediately setting](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.DBInstance.Modifying.html#USER_ModifyInstance.ApplyImmediately) in the *Amazon RDS User Guide*\.

   On the confirmation page, review your changes\. If they are correct, choose **Modify DB Instance**\.

