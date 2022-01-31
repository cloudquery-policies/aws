## \[Redshift\.6\] Amazon Redshift should have automatic upgrades to major versions enabled

**Category:** Detect > Vulnerability and patch management

**Severity:** Medium

**Resource type:** `AWS::Redshift::Cluster`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/redshift-cluster-maintenancesettings-check.html](https://docs.aws.amazon.com/config/latest/developerguide/redshift-cluster-maintenancesettings-check.html)

**Parameters:**
+ `allowVersionUpgrade = true`

This control checks whether automatic major version upgrades are enabled for the Amazon Redshift cluster\.

Enabling automatic major version upgrades ensures that the latest major version updates to Amazon Redshift clusters are installed during the maintenance window\. These updates might include security patches and bug fixes\. Keeping up to date with patch installation is an important step in securing systems\.

**Note**  
This control is not supported in Middle East \(Bahrain\)\.

### Remediation<a name="redshift-6-remediation"></a>

To remediate this issue from the AWS CLI, use the Amazon Redshift `modify-cluster` command to set the `--allow-version-upgrade` attribute\.

```
aws redshift modify-cluster --cluster-identifier clustername --allow-version-upgrade
```

Where `clustername` is the name of your Amazon Redshift cluster\.

