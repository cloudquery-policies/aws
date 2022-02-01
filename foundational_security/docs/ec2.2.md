## \[EC2\.2\] The VPC default security group should not allow inbound and outbound traffic

**Category:** Protect > Secure network configuration

**Severity:** High 

**Resource type:** `AWS::EC2::SecurityGroup`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/vpc-default-security-group-closed.html](https://docs.aws.amazon.com/config/latest/developerguide/vpc-default-security-group-closed.html)

**Parameters:** None

This control checks that the default security group of a VPC does not allow inbound or outbound traffic\.

The rules for the [default security group](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html#DefaultSecurityGroup) allow all outbound and inbound traffic from network interfaces \(and their associated instances\) that are assigned to the same security group\.

We do not recommend using the default security group\. Because the default security group cannot be deleted, you should change the default security group rules setting to restrict inbound and outbound traffic\. This prevents unintended traffic if the default security group is accidentally configured for resources such as EC2 instances\.

### Remediation<a name="ec2-2-remediation"></a>

To remediate this issue, create new security groups and assign those security groups to your resources\. To prevent the default security groups from being used, remove their inbound and outbound rules\.

**To create new security groups and assign them to your resources**

1. Open the Amazon VPC console at [https://console\.aws\.amazon\.com/vpc/](https://console.aws.amazon.com/vpc/)\.

1. In the navigation pane, choose **Security groups**\. View the default security groups details to see the resources that are assigned to them\.

1. Create a set of least\-privilege security groups for the resources\. For details on how to create security groups, see [Creating a security group](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html#CreatingSecurityGroups) in the *Amazon VPC User Guide*\.

1. Open the Amazon EC2 console at [https://console\.aws\.amazon\.com/ec2/](https://console.aws.amazon.com/ec2/)\.

1. On the Amazon EC2 console, change the security group for the resources that use the default security groups to the least\-privilege security group you created\. See [Changing an instance's security groups](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html#SG_Changing_Group_Membership) in the *Amazon VPC User Guide*\.

After you assign the new security groups to the resources, remove the inbound and outbound rules from the default security groups\. This ensures that the default security groups are not used\.

**To remove the rules from the default security group**

1. Open the Amazon VPC console at [https://console\.aws\.amazon\.com/vpc/](https://console.aws.amazon.com/vpc/)\.

1. In the navigation pane, choose **Security groups**\.

1. Select a default security group and choose the **Inbound rules** tab\. Choose **Edit inbound rules**\. Then delete all inbound rules\. Choose **Save rules**\.

1. Repeat the previous step for each default security group\.

1. Select a default security group and choose the **Outbound rule** tab\. Choose **Edit outbound rules**\. Then delete all outbound rules\. Choose **Save rules**\.

1. Repeat the previous step for each default security group\.

For more information, see [Working with security groups](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html#WorkingWithSecurityGroups) in the *Amazon VPC User Guide*\.

