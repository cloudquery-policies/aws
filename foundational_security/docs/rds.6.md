## \[RDS\.6\] Enhanced monitoring should be configured for RDS DB instances and clusters<a name="fsbp-rds-6"></a>

**Category:** Detect > Detection services

**Severity:** Low

**Resource type:** `AWS::RDS::DBInstance`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/rds-enhanced-monitoring-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/rds-enhanced-monitoring-enabled.html)

**Parameters:** None

This control checks whether enhanced monitoring is enabled for your RDS DB instances\.

In Amazon RDS, Enhanced Monitoring enables a more rapid response to performance changes in underlying infrastructure\. These performance changes could result in a lack of availability of the data\. Enhanced Monitoring provides real\-time metrics of the operating system that your RDS DB instance runs on\. An agent is installed on the instance\. The agent can obtain metrics more accurately than is possible from the hypervisor layer\.

Enhanced Monitoring metrics are useful when you want to see how different processes or threads on a DB instance use the CPU\. For more information, see [Enhanced Monitoring](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html) in the *Amazon RDS User Guide*\.

### Remediation<a name="rds-6-remediation"></a>

For detailed instructions on how to enable Enhanced Monitoring for your DB instance, see [Setting up for and enabling Enhanced Monitoring](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html#USER_Monitoring.OS.Enabling) in the *Amazon RDS User Guide*\.

