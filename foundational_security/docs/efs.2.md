## \[EFS\.2\] Amazon EFS volumes should be in backup plans

**Category:** Recover > Resilience > Backup

**Severity:** Medium

**Resource type:** `AWS::EFS::FileSystem`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/efs-in-backup-plan.html](https://docs.aws.amazon.com/config/latest/developerguide/efs-in-backup-plan.html)

**Parameters:** None

This control checks whether Amazon Elastic File System \(Amazon EFS\) file systems are added to the backup plans in AWS Backup\. The control fails if Amazon EFS file systems are not included in the backup plans\. 

Including EFS file systems in the backup plans helps you to protect your data from deletion and data loss\.

**Note**  
This control is not supported in the following Regions:  
Africa \(Cape Town\)
Europe \(Milan\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="efs-2-remediation"></a>

To remediate this issue, update your file system to enable automatic backups\.

**To enable automatic backups for an existing file system**

1. Open the Amazon Elastic File System console at [https://console\.aws\.amazon\.com/efs/](https://console.aws.amazon.com/efs/)\.

1. On the **File systems** page, choose the file system for which to enable automatic backups\.

   The **File system details** page is displayed\.

1. Under **General**, choose **Edit**\.

1. To enable automatic backups, select **Enable automatic backups**\. 

1. Choose **Save changes**\.

To learn more, visit [Using AWS Backup with Amazon EFS](https://docs.aws.amazon.com/efs/latest/ug/awsbackup.html) in the *Amazon Elastic File System User Guide*\.

