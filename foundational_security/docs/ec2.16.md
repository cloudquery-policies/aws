## \[EC2\.16\] Unused network access control lists should be removed

**Category:** Prevent > Network security 

**Severity:** Low

**Resource type:** `AWS::EC2::NetworkAcl`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/vpc-network-acl-unused-check.html](https://docs.aws.amazon.com/config/latest/developerguide/vpc-network-acl-unused-check.html)

**Parameters:** None

This control checks whether there are any unused network access control lists \(ACLs\)\.

The control checks the item configuration of the resource `AWS::EC2::NetworkAcl` and determines the relationships of the network ACL\.

If the only relationship is the VPC of the network ACL, then the control fails\.

If other relationships are listed, then the control passes\.

**Note**  
This control is not supported in the following Regions:  
Asia Pacific \(Osaka\)
China \(Beijing\)
China \(Ningxia\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="ec2-16-remediation"></a>

For instructions on how to delete an unused network ACL, see [Deleting a network ACL](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html#DeleteNetworkACL) in the *Amazon VPC User Guide*\.

