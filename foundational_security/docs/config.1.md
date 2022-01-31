## \[Config\.1\] AWS Config should be enabled

**Category:** Identify > Inventory

**Severity:** Medium

**Resource type:** AWS account

**AWS Config rule:** None

**Parameters:** None

This control checks whether AWS Config is enabled in the account for the local Region and is recording all resources\.

The AWS Config service performs configuration management of supported AWS resources in your account and delivers log files to you\. The recorded information includes the configuration item \(AWS resource\), relationships between configuration items, and any configuration changes between resources\. 

Security Hub recommends that you enable AWS Config in all Regions\. The AWS configuration item history that AWS Config captures enables security analysis, resource change tracking, and compliance auditing\. 

**Note**  
Because Security Hub is a Regional service, the check performed for this control checks only the current Region for the account\. It does not check all Regions\.   
To allow security checks against global resources in each Region, you also must record global resources\. If you only record global resources in a single Region, then you can disable this control in all Regions except the Region where you record global resources\.

To learn more, see [Getting started with AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/getting-started.html) in the *AWS Config Developer Guide*\.

### Remediation<a name="config-1-remediation"></a>

After you enable AWS Config, configure it to record all resources\.

**To configure AWS Config settings**

1. Open the AWS Config console at [https://console\.aws\.amazon\.com/config/](https://console.aws.amazon.com/config/)\.

1. Choose the Region to configure AWS Config in\.

1. If you have not used AWS Config before, choose **Get started**\.

1. On the **Settings** page, do the following:

   1. Under **Resource types to record**, choose **Record all resources supported in this region** and **Include global resources \(e\.g\. AWS IAM resources\)**\. 

   1. Under **AWS Config role**, either choose **Create AWS Config service\-linked role** or **Choose a role from your account** and then choose the role to use\.

   1. Under **Amazon S3 bucket**, specify the bucket to use or create a bucket and optionally include a prefix\. 

   1. Under **Amazon SNS topic**, choose an Amazon SNS topic from your account or create one\. For more information about Amazon SNS, see the [https://docs.aws.amazon.com/sns/latest/gsg/](https://docs.aws.amazon.com/sns/latest/gsg/)\. 

1. Choose **Next**\.

1. On the **AWS Config rules** page, choose **Next**\. 

1. Choose **Confirm**\.

For more information about using AWS Config from the AWS CLI, see [Turning on AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/gs-cli-subscribe.html) in the *AWS Config Developer Guide*\. 

You can also use an AWS CloudFormation template to automate this process\. For more information, see the [AWS CloudFormation StackSets sample template](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-sampletemplates.html) in the *AWS CloudFormation User Guide*\. 

