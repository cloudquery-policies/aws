## \[EMR\.1\] Amazon EMR cluster master nodes should not have public IP addresses

**Category:** Protect > Secure network configuration

**Severity:** High

**Resource type:** `AWS::EMR::Cluster`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/emr-master-no-public-ip.html](https://docs.aws.amazon.com/config/latest/developerguide/emr-master-no-public-ip.html)

**Parameters:** None

This control checks whether master nodes on Amazon EMR clusters have public IP addresses\. 

The control fails if the master node has public IP addresses that are associated with any of its instances\. Public IP addresses are designated in the `PublicIp` field of the `NetworkInterfaces` configuration for the instance\. This control only checks Amazon EMR clusters that are in a `RUNNING` or `WAITING` state\.

**Note**  
This control is not supported in Africa \(Cape Town\) or Europe \(Milan\)\.

### Remediation<a name="emr-1-remediation"></a>

During launch, you can control whether your instance in a default or nondefault subnet is assigned a public IPv4 address\.

By default, default subnets have this attribute set to `true`\. Nondefault subnets have the IPv4 public addressing attribute set to `false`, unless it was created by the Amazon EC2 launch instance wizard\. In that case, the wizard sets the attribute to `true`\.

You need to launch your cluster in a VPC with a private subnet that has the IPv4 public addressing attribute set to `false`\. 

After launch, you cannot manually disassociate a public IPv4 address from your instance\.

To remediate this finding, you need to create a new cluster in VPC private subnet\. For information on how to launch a cluster in into a VPC private subnet, see [Launch clusters into a VPC](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-vpc-launching-job-flows.html) in the *Amazon EMR Management Guide*\.

