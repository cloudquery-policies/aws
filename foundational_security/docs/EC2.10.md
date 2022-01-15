## \[EC2\.10\] Amazon EC2 should be configured to use VPC endpoints that are created for the Amazon EC2 service<a name="fsbp-ec2-10"></a>

**Category:** Protect \- Secure network configuration > API private access

**Severity:** Medium

**Resource type:** `AWS::EC2::VPC`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/service-vpc-endpoint-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/service-vpc-endpoint-enabled.html)

**Parameters:** 
+ `serviceName`: `ec2`

This control checks whether a service endpoint for Amazon EC2 is created for each VPC\. The control fails if a VPC does not have a VPC endpoint created for the Amazon EC2 service\. 

To improve the security posture of your VPC, you can configure Amazon EC2 to use an interface VPC endpoint\. Interface endpoints are powered by AWS PrivateLink, a technology that enables you to access Amazon EC2 API operations privately\. It restricts all network traffic between your VPC and Amazon EC2 to the Amazon network\. Because endpoints are supported within the same Region only, you cannot create an endpoint between a VPC and a service in a different Region\. This prevents unintended Amazon EC2 API calls to other Regions\. 

To learn more about creating VPC endpoints for Amazon EC2, see [Amazon EC2 and interface VPC endpoints ](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/interface-vpc-endpoints.html)in the *Amazon EC2 User Guide for Linux Instances*\.

### Remediation<a name="ec2-10-remediation"></a>

To remediate this issue, you can create an interface VPC endpoint to Amazon EC2\.

**To create an interface endpoint to Amazon EC2 from the Amazon VPC console**

1. Open the Amazon VPC console at [https://console\.aws\.amazon\.com/vpc/](https://console.aws.amazon.com/vpc/)\.

1. In the navigation pane, choose **Endpoints**\.

1. Choose **Create Endpoint**\. 

1. For **Service category**, choose **AWS services**\. 

1. For **Service Name**, choose **com\.amazonaws\.<region>\.ec2**\.

1. For **Type**, choose **Interface**\. 

1. Complete the following information\. 

   1. For **VPC**, select a VPC in which to create the endpoint\. 

   1. For **Subnets**, select the subnets \(Availability Zones\) in which to create the endpoint network interfaces\. Not all Availability Zones are supported for all AWS services\. 

   1. To enable private DNS for the interface endpoint, select the check box for **Enable DNS Name**\. This option is enabled by default\.

      To use the private DNS option, the following attributes of your VPC must be set to true:
      + `enableDnsHostnames`
      + `enableDnsSupport`

      For more information, see [Viewing and updating DNS support for your VPC](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-dns.html#vpc-dns-updating) in the *Amazon VPC User Guide*\. 

   1. For **Security group**, select the security groups to associate with the endpoint network interfaces\. 

   1. \(Optional\) Add or remove a tag\. To add a tag, choose **Add tag** and do the following: 
      + For **Key**, enter the tag name\. 
      + For **Value**, enter the tag value\.

   1. To remove a tag, choose the delete button \(**x**\) to the right of the tag **Key** and **Value**\. 

1. Choose **Create endpoint**\.

**To create an interface VPC endpoint policy**

You can attach a policy to your VPC endpoint to control access to the Amazon EC2 API\. The policy specifies the following: 
+ The principal that can perform actions
+ The actions that can be performed
+ The resource on which the actions can be performed

For more details on creating a VPC endpoint policy, see [Amazon EC2 and interface VPC endpoints](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/interface-vpc-endpoints.html) In the *Amazon EC2 User Guide for Linux Instances*\.

