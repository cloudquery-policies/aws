## \[EC2\.6\] VPC flow logging should be enabled in all VPCs

**Category:** Identify > Logging

**Severity:** Medium

**Resource type:** `AWS::EC2::VPC`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/vpc-flow-logs-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/vpc-flow-logs-enabled.html)

**Parameters:**
+ `trafficType`: `REJECT`

This control checks whether Amazon VPC Flow Logs are found and enabled for VPCs\. The traffic type is set to `Reject`\. 

With the VPC Flow Logs feature, you can capture information about the IP address traffic going to and from network interfaces in your VPC\. After you create a flow log, you can view and retrieve its data in CloudWatch Logs\. To reduce cost, you can also send your flow logs to Amazon S3\. 

Security Hub recommends that you enable flow logging for packet rejects for VPCs\. Flow logs provide visibility into network traffic that traverses the VPC and can detect anomalous traffic or provide insight during security workflows\. 

By default, the record includes values for the different components of the IP address flow, including the source, destination, and protocol\. For more information and descriptions of the log fields, see [VPC Flow Logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html) in the *Amazon VPC User Guide*\.

### Remediation<a name="ec2-6-remediation"></a>

To remediate this issue, enable VPC flow logging\.

**To enable VPC flow logging**

1. Open the Amazon VPC console at [https://console\.aws\.amazon\.com/vpc/](https://console.aws.amazon.com/vpc/)\.

1. Under **Virtual Private Cloud**, choose **Your VPCs**\.

1. Select a VPC to update\.

1. At the bottom of the page, choose **Flow Logs**\.

1. Choose **Create flow log**\.

1. For **Filter**, choose **Reject**\.

1. For **Destination log group**, choose the log group to use\.

1. For **IAM role**, choose the IAM role to use\.

1. Choose **Create**\.

