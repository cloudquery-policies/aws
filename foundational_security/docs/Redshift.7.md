## \[Redshift\.7\] Amazon Redshift clusters should use enhanced VPC routing<a name="fsbp-redshift-7"></a>

**Category:** Protect > Secure network configuration > API private access

**Severity:** High

**Resource type:** `AWS::Redshift::Cluster`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/redshift-enhanced-vpc-routing-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/redshift-enhanced-vpc-routing-enabled.html)

**Parameters:** None

This control checks whether an Amazon Redshift cluster has `EnhancedVpcRouting` enabled\.

Enhanced VPC routing forces all `COPY` and `UNLOAD` traffic between the cluster and data repositories to go through your VPC\. You can then use VPC features such as security groups and network access control lists to secure network traffic\. You can also use VPC Flow Logs to monitor network traffic\.

**Note**  
This control is not supported in the following Regions:  
Asia Pacific \(Osaka\)
China \(Beijing\)
China \(Ningxia\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="redshift-7-remediation"></a>

For detailed remediation instructions, see [Enabling enhanced VPC routing](https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-enabling-cluster.html) in the *Amazon Redshift Cluster Management Guide*\.

