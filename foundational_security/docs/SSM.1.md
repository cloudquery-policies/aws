## \[SSM\.1\] EC2 instances should be managed by AWS Systems Manager<a name="fsbp-ssm-1"></a>

**Category:** Identify > Inventory

**Severity:** Medium

**Resource type:** `AWS::EC2::Instance`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/ec2-instance-managed-by-systems-manager.html](https://docs.aws.amazon.com/config/latest/developerguide/ec2-instance-managed-by-systems-manager.html)

**Parameters:** None

This control checks whether the stopped and running EC2 instances in your account are managed by AWS Systems Manager\. Systems Manager is an AWS service that you can use to view and control your AWS infrastructure\.

To help you to maintain security and compliance, Systems Manager scans your stopped and running managed instances\. A managed instance is a machine that is configured for use with Systems Manager\. Systems Manager then reports or takes corrective action on any policy violations that it detects\. Systems Manager also helps you to configure and maintain your managed instances\.

To learn more, see [https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html](https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html)\.

### Remediation<a name="ssm-1-remediation"></a>

You can use the Systems Manager console to remediate this issue\.

**To ensure that EC2 instances are managed by Systems Manager**

1. Open the AWS Systems Manager console at [https://console\.aws\.amazon\.com/systems\-manager/](https://console.aws.amazon.com/systems-manager/)\.

1. In the navigation menu, choose **Quick setup**\.

1. Choose **Create**\.

1. Under **Configuration type**, choose **Host Management**, then choose **Next**\.

1. On the configuration screen, you can keep the default options\.

   You can optionally make the following changes:

   1. If you use CloudWatch to monitor EC2 instances, select **Install and configure the CloudWatch agent** and **Update the CloudWatch agent once every 30 days**\.

   1. Under **Targets**, choose the management scope to determine the accounts and Regions where this configuration is applied\.

   1. Under **Instance profile options**, select **Add required IAM policies to existing instance profiles attached to your instances**\.

1. Choose **Create**\.

To determine whether your instances support Systems Manager associations, see [Systems Manager prerequisites](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-prereqs.html) in the *AWS Systems Manager User Guide*\.

