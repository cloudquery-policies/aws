## \[RDS\.14\] Amazon Aurora clusters should have backtracking enabled<a name="fsbp-rds-14"></a>

**Category:** Recover > Resilience > Backups enabled 

**Severity:** Medium

**Resource type:** `AWS::RDS::DBCluster`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/aurora-mysql-backtracking-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/aurora-mysql-backtracking-enabled.html)

**Parameters:** None

This control checks whether Amazon Aurora clusters have backtracking enabled\.

Backups help you to recover more quickly from a security incident\. They also strengthens the resilience of your systems\. Aurora backtracking reduces the time to recover a database to a point in time\. It does not require a database restore to do so\.

For more information about backtracking in Aurora, see [Backtracking an Aurora DB cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Managing.Backtrack.html) in the *Amazon Aurora User Guide*\.

**Note**  
This control is not supported in the following Regions:  
Africa \(Cape Town\)
Asia Pacific \(Hong Kong\)
Asia Pacific \(Osaka\)
China \(Beijing\)
China \(Ningxia\)
Europe \(Milan\)
Europe \(Stockholm\)
Middle East \(Bahrain\)
South America \(São Paulo\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="rds-14-remediation"></a>

For detailed instructions on how to enable Aurora backtracking, see [Configuring backtracking](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Managing.Backtrack.html#AuroraMySQL.Managing.Backtrack.Configuring) in the *Amazon Aurora User Guide*\.

Note that you cannot enable backtracking on an existing cluster\. Instead, you can create a clone that has backtracking enabled\. For more information about the limitations of Aurora backtracking, see the list of limitations in [Overview of backtracking](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Managing.Backtrack.html)\.

For information about pricing for backtracking, see the [Aurora pricing page](http://aws.amazon.com/rds/aurora/pricing/)\.

