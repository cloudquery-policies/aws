## \[CloudTrail\.4\] Ensure CloudTrail log file validation is enabled

**Category:** Data protection > Data integrity

**Severity:** Low

**Resource type:** `AWS::CloudTrail::Trail`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/cloud-trail-log-file-validation-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/cloud-trail-log-file-validation-enabled.html)

**Parameters:** None

This control checks whether log file integrity validation is enabled on a CloudTrail trail\.

CloudTrail log file validation creates a digitally signed digest file that contains a hash of each log that CloudTrail writes to Amazon S3\. You can use these digest files to determine whether a log file was changed, deleted, or unchanged after CloudTrail delivered the log\.

Security Hub recommends that you enable file validation on all trails\. Log file validation provides additional integrity checks of CloudTrail logs\.

For more information, see [Enabling validation and validating files](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-log-file-validation-intro.html#cloudtrail-log-file-validation-intro-enabling-and-using) in the *AWS CloudTrail User Guide*\.

### Remediation<a name="cloudtrail-4-remediation"></a>

To remediate this issue, update your CloudTrail trail to enable log file validation\.

**To enable CloudTrail log file validation**

1. Open the CloudTrail console at [https://console\.aws\.amazon\.com/cloudtrail/](https://console.aws.amazon.com/cloudtrail/)\.

1. Choose **Trails**\.

1. Under **Name**, choose the name of a trail to edit\.

1. Under **General details**, choose **Edit**\.

1. Under **Additional settings**, for **Log file validation**, choose **Enabled**\.

1. Choose **Save changes**\.

For more information, see [Validating CloudTrail log file integrity](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-log-file-validation-intro.html) in the *AWS CloudTrail User Guide*\.

