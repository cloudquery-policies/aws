## \[Redshift\.4\] Amazon Redshift clusters should have audit logging enabled<a name="fsbp-redshift-4"></a>

**Category:** Identify > Logging

**Severity:** Medium

**Resource type:** `AWS::Redshift::Cluster`

**AWS Config rule:** `redshift-cluster-audit-logging-enabled` \(Custom rule developed by Security Hub\)

**Parameters:**
+ `loggingEnabled = true`

This control checks whether an Amazon Redshift cluster has audit logging enabled\.

Amazon Redshift audit logging provides additional information about connections and user activities in your cluster\. This data can be stored and secured in Amazon S3 and can be helpful in security audits and investigations\. For more information, see [Database audit logging](https://docs.aws.amazon.com/redshift/latest/mgmt/db-auditing.html) in the *Amazon Redshift Cluster Management Guide*\.

### Remediation<a name="redshift-4-remediation"></a>

**To enable cluster audit logging**

1. Open the Amazon Redshift console at [https://console\.aws\.amazon\.com/redshift/](https://console.aws.amazon.com/redshift/)\.

1. In the navigation menu, choose **Clusters**, then choose the name of the cluster to modify\.

1. Choose **Maintenance and monitoring**\.

1. Under **Audit logging**, choose **Edit**\.

1. Set **Enable audit logging** to **yes**, then enter the log destination bucket details\.

1. Choose **Confirm**\.

