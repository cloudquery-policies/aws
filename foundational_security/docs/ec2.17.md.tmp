## \[EC2\.17\] EC2 instances should not use multiple ENIs<a name="fsbp-ec2-17"></a>

**Category:** Network security 

**Severity:** Low

**Resource type:** `AWS::EC2::Instance`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/ec2-instance-multiple-eni-check.html](https://docs.aws.amazon.com/config/latest/developerguide/ec2-instance-multiple-eni-check.html)

**Parameters:**
+ `Adapterids` \(Optional\) – A list of network interface IDs that are attached to EC2 instances

This control checks whether an EC2 instance uses multiple Elastic Network Interfaces \(ENIs\) or Elastic Fabric Adapters \(EFAs\)\. This control passes if a single network adapter is used\. The control includes an optional parameter list to identify the allowed ENIs\.

Multiple ENIs can cause dual\-homed instances, meaning instances that have multiple subnets\. This can add network security complexity and introduce unintended network paths and access\.

This control also fails if an Amazon EKS cluster that belongs to an Amazon EKS cluster has more than one ENI\. If you need to use EC2 instances that have multiple ENIs as part of an Amazon EKS cluster, you can suppress those findings\.

**Note**  
This control is not supported in the following Regions:  
Asia Pacific \(Osaka\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="ec2-17-remediation"></a>

To remediate this issue, detach the additional ENIs\.

**To detach a network interface**

1. Open the Amazon EC2 console at [https://console\.aws\.amazon\.com/ec2/](https://console.aws.amazon.com/ec2/)\.

1. Under **Network & Security**, choose **Network Interfaces**\.

1. Filter the list by the noncompliant instance IDs to see the associated ENIs\.

1. Select the ENIs that you want to remove\.

1. From the **Actions** menu, choose **Detach**\.

1. If you see the prompt **Are you sure that you want to detach the following network interface?**, choose **Detach**\.

