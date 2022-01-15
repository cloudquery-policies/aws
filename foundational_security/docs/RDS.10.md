## \[RDS\.10\] IAM authentication should be configured for RDS instances<a name="fsbp-rds-10"></a>

**Category:** Protect > Secure access management > Passwordless authentication

**Severity:** Medium

**Resource type:** `AWS::RDS::DBInstance`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/rds-instance-iam-authentication-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/rds-instance-iam-authentication-enabled.html)

**Parameters:** None

This control checks whether an RDS DB instance has IAM database authentication enabled\.

IAM database authentication allows authentication to database instances with an authentication token instead of a password\. Network traffic to and from the database is encrypted using SSL\. For more information, see [IAM database authentication](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html) in the *Amazon Aurora User Guide*\.

**Note**  
This control is not supported in the following Regions:  
Africa \(Cape Town\)  
Asia Pacific \(Hong Kong\)  
Asia Pacific \(Osaka\)  
China \(Beijing\)  
China \(Ningxia\)

### Remediation<a name="rds-10-remediation"></a>

To remediate this issue, update your DB instance to enable IAM authentication\.

**To enable IAM authentication for an existing DB instance**

1. Open the Amazon RDS console at [https://console\.aws\.amazon\.com/rds/](https://console.aws.amazon.com/rds/)\.

1. Choose **Databases**\.

1. Select the DB instance to modify\.

1. Choose **Modify**\. 

1. Under **Database options**, choose **Enable IAM DB authentication**\.

1. Choose **Continue**\.

1. Under **Scheduling of modifications**, choose when to apply modifications\. The options are **Apply during the next scheduled maintenance window** or **Apply immediately**\.

1. For clusters, choose **Modify DB Instance**\.

