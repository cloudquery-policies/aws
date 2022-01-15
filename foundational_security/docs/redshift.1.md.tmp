## \[Redshift\.1\] Amazon Redshift clusters should prohibit public access<a name="fsbp-redshift-1"></a>

**Category:** Protect > Secure network configuration > Resources not publicly accessible

**Severity:** Critical

**Resource type:** `AWS::Redshift::Cluster`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/redshift-cluster-public-access-check.html](https://docs.aws.amazon.com/config/latest/developerguide/redshift-cluster-public-access-check.html)

**Parameters:** None 

This control checks whether Amazon Redshift clusters are publicly accessible\. It evaluates the `PubliclyAccessible` field in the cluster configuration item\. 

The `PubliclyAccessible` attribute of the Amazon Redshift cluster configuration indicates whether the cluster is publicly accessible\. When the cluster is configured with `PubliclyAccessible` set to `true`, it is an Internet\-facing instance that has a publicly resolvable DNS name, which resolves to a public IP address\.

When the cluster is not publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address\. Unless you intend for your cluster to be publicly accessible, the cluster should not be configured with `PubliclyAccessible` set to `true`\.

### Remediation<a name="redshift-1-remediation"></a>

To remediate this issue, update your Amazon Redshift cluster to disable public access\.

**To disable public access to an Amazon Redshift cluster**

1. Open the Amazon Redshift console at [https://console\.aws\.amazon\.com/redshift/](https://console.aws.amazon.com/redshift/)\.

1. In the navigation menu, choose **Clusters**, then choose the name of the cluster with the security group to modify\.

1. Choose **Actions**, then choose **Modify publicly accessible setting**\.

1. Under **Allow instances and devices outside the VPC to connect to your database through the cluster endpoint**, choose **No**\.

1. Choose **Confirm**\.

