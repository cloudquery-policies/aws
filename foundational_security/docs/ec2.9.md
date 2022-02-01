## \[EC2\.9\] EC2 instances should not have a public IP address

**Category:** Protect > Secure network configuration > Public IP addresses

**Severity:** High

**Resource type:** `AWS::EC2::Instance`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/ec2-instance-no-public-ip.html](https://docs.aws.amazon.com/config/latest/developerguide/ec2-instance-no-public-ip.html)

**Parameters:** None

This control checks whether EC2 instances have a public IP address\. The control fails if the `publicIp` field is present in the EC2 instance configuration item\. This control applies to IPv4 addresses only\. 

A public IPv4 address is an IP address that is reachable from the internet\. If you launch your instance with a public IP address, then your EC2 instance is reachable from the internet\. A private IPv4 address is an IP address that is not reachable from the internet\. You can use private IPv4 addresses for communication between EC2 instances in the same VPC or in your connected private network\.

IPv6 addresses are globally unique, and therefore are reachable from the internet\. However, by default all subnets have the IPv6 addressing attribute set to false\. For more information about IPv6, see [IP addressing in your VPC](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-ip-addressing.html) in the *Amazon VPC User Guide*\.

If you have a legitimate use case to maintain EC2 instances with public IP addresses, then you can suppress the findings from this control\. For more information about front\-end architecture options, see the [AWS Architecture Blog](http://aws.amazon.com/blogs/architecture/) or the [This Is My Architecture series](http://aws.amazon.com/this-is-my-architecture/?tma.sort-by=item.additionalFields.airDate&tma.sort-order=desc&awsf.category=categories%23mobile)\.

### Remediation<a name="ec2-9-remediation"></a>

Use a non\-default VPC so that your instance is not assigned a public IP address by default\.

When you launch an EC2 instance into a default VPC, it is assigned a public IP address\. When you launch an EC2 instance into a non\-default VPC, the subnet configuration determines whether it receives a public IP address\. The subnet has an attribute to determine if new EC2 instances in the subnet receive a public IP address from the public IPv4 address pool\.

You cannot manually associate or disassociate an automatically\-assigned public IP address from your EC2 instance\. To control whether your EC2 instance receives a public IP address, do one of the following:
+ Modify the public IP addressing attribute of your subnet\. For more information, see [Modifying the public IPv4 addressing attribute for your subnet](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-ip-addressing.html#subnet-public-ip) in the *Amazon VPC User Guide*\. 
+ Enable or disable the public IP addressing feature during launch\. This overrides the subnet's public IP addressing attribute\. For more information, see[ Assign a public IPv4 address during instance launch](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html#public-ip-addresses) in the *Amazon EC2 User Guide for Linux Instances*\.

For more information, see [Public IPv4 addresses and external DNS hostnames](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html#concepts-public-addresses) in the *Amazon EC2 User Guide for Linux Instances*\.

If your EC2 instance is associated with an Elastic IP address, then your EC2 instance is reachable from the internet\. You can disassociate an Elastic IP address from an instance or network interface at any time\.

**To disassociate an Elastic IP address**

1. Open the Amazon EC2 console at [https://console\.aws\.amazon\.com/ec2/](https://console.aws.amazon.com/ec2/)\.

1. In the navigation pane, choose **Elastic IPs**\.

1. Select the Elastic IP address to disassociate\.

1. From **Actions**, choose **Disassociate Elastic IP address**\.

1. Choose **Disassociate**\.

