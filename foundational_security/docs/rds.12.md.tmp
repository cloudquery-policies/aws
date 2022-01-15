## \[RDS\.12\] IAM authentication should be configured for RDS clusters<a name="fsbp-rds-12"></a>

**Category:** Protect > Secure access management > Passwordless authentication

**Severity:** Medium

**Resource type:** `AWS::RDS::DBCluster`, `AWS::RDS::DBInstance`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/rds-cluster-iam-authentication-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/rds-cluster-iam-authentication-enabled.html)

**Parameters:** None

This control checks whether an RDS DB cluster has IAM database authentication enabled\.

IAM database authentication allows for password\-free authentication to database instances\. The authentication uses an authentication token\. Network traffic to and from the database is encrypted using SSL\. For more information, see [IAM database authentication](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html) in the *Amazon Aurora User Guide*\.

**Note**  
This control is not supported in the following Regions:  
Asia Pacific \(Osaka\)
China \(Beijing\)
China \(Ningxia\)
Middle East \(Bahrain\)
South America \(São Paulo\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="rds-12-remediation"></a>

You can enable IAM authentication for a DB cluster from the Amazon RDS console\.

**To enable IAM authentication for an existing DB cluster**

1. Open the Amazon RDS console at [https://console\.aws\.amazon\.com/rds/](https://console.aws.amazon.com/rds/)\.

1. Choose **Databases**\.

1. Choose the DB cluster to modify\.

1. Choose **Modify**\.

1. Under **Database options**, select **Enable IAM DB authentication**\.

1. Choose **Continue**\. 

1. Under **Scheduling of modifications**, choose when to apply modifications: **Apply during the next scheduled maintenance window** or **Apply immediately**\.

1. Choose **Modify cluster**\.

