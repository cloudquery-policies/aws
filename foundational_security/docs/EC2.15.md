## \[EC2\.15\] EC2 subnets should not automatically assign public IP addresses<a name="fsbp-ec2-15"></a>

**Category:** Protect > Network security

**Severity:** Medium

**Resource type:** `AWS::EC2::Subnet`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/subnet-auto-assign-public-ip-disabled.html](https://docs.aws.amazon.com/config/latest/developerguide/subnet-auto-assign-public-ip-disabled.html)

**Parameters:** None

This control checks whether the assignment of public IPs in Amazon Virtual Private Cloud \(Amazon VPC\) subnets have `MapPublicIpOnLaunch` set to `FALSE`\. The control passes if the flag is set to `FALSE`\. 

All subnets have an attribute that determines whether a network interface created in the subnet automatically receives a public IPv4 address\. Instances that are launched into subnets that have this attribute enabled have a public IP address assigned to their primary network interface\.

**Note**  
This control is not supported in the following Regions:  
Asia Pacific \(Osaka\)
China \(Beijing\)
China \(Ningxia\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="ec2-15-remediation"></a>

You can configure a subnet from the Amazon VPC console\.

**To configure a subnet to not assign public IP addresses**

1. Open the Amazon VPC console at [https://console\.aws\.amazon\.com/vpc/](https://console.aws.amazon.com/vpc/)\.

1. In the navigation pane, choose **Subnets**\.

1. Select your subnet and then choose **Subnet Actions**, **Modify auto\-assign IP settings**\.

1. Clear the **Enable auto\-assign public IPv4 address** check box and then choose **Save**\.

