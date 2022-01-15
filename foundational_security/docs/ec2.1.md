## \[EC2\.1\] Amazon EBS snapshots should not be public, determined by the ability to be restorable by anyone<a name="fsbp-ec2-1"></a>

**Category:** Protect > Secure network configuration

**Severity:** Critical 

**Resource type:** AWS account

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/ebs-snapshot-public-restorable-check.html](https://docs.aws.amazon.com/config/latest/developerguide/ebs-snapshot-public-restorable-check.html)

**Parameters:** None

This control checks that Amazon Elastic Block Store snapshots are not public, as determined by the ability to be restorable by anyone\.

EBS snapshots are used to back up the data on your EBS volumes to Amazon S3 at a specific point in time\. You can use the snapshots to restore previous states of EBS volumes\. It is rarely acceptable to share a snapshot with the public\. Typically the decision to share a snapshot publicly was made in error or without a complete understanding of the implications\. This check helps ensure that all such sharing was fully planned and intentional\.

**Note**  
This control is not supported in Africa \(Cape Town\) or Europe \(Milan\)\.

### Remediation<a name="ec2-1-remediation"></a>

To remediate this issue, update your EBS snapshot to make it private instead of public\.

**To make a public EBS snapshot private**

1. Open the Amazon EC2 console at [https://console\.aws\.amazon\.com/ec2/](https://console.aws.amazon.com/ec2/)\.

1. In the navigation pane, under **Elastic Block Store**, choose **Snapshots** menu and then choose your public snapshot\.

1. From **Actions**, choose **Modify permissions**\.

1. Choose **Private**\.

1. \(Optional\) Add the AWS account numbers of the authorized accounts to share your snapshot with and choose **Add Permission**\.

1. Choose **Save**\.

