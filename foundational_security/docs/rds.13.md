## \[RDS\.13\] RDS automatic minor version upgrades should be enabled

**Category:** Detect > Vulnerability and patch management 

**Severity:** High

**Resource type:** `AWS::RDS::DBInstance`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/rds-automatic-minor-version-upgrade-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/rds-automatic-minor-version-upgrade-enabled.html)

**Parameters:** None

This control checks whether automatic minor version upgrades are enabled for the RDS database instance\.

Enabling automatic minor version upgrades ensures that the latest minor version updates to the relational database management system \(RDBMS\) are installed\. These upgrades might include security patches and bug fixes\. Keeping up to date with patch installation is an important step in securing systems\.

**Note**  
This control is not supported in the following Regions:  
Asia Pacific \(Osaka\)
China \(Beijing\)
China \(Ningxia\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="rds-13-remediation"></a>

You can enable minor version upgrades for a DB instance from the Amazon RDS console\.

**To enable automatic minor version upgrades for an existing DB instance**

1. Open the Amazon RDS console at [https://console\.aws\.amazon\.com/rds/](https://console.aws.amazon.com/rds/)\.

1. Choose **Databases**\.

1. Choose the DB instance to modify\.

1. Choose **Modify**\. 

1. Under **Maintenance**, select **Yes** for **Auto minor version upgrade**\.

1. Choose **Continue**\.

1. Under **Scheduling of modifications**, choose when to apply modifications: **Apply during the next scheduled maintenance window** or **Apply immediately**\.

1. Choose **Modify DB Instance**\.

