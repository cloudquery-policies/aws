## \[EC2\.18\] Security groups should only allow unrestricted incoming traffic for authorized ports<a name="fsbp-ec2-18"></a>

**Category:** Protect > Secure network configuration > Security group configuration

**Severity:** High

**Resource type:** `AWS::EC2::SecurityGroup`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/vpc-sg-open-only-to-authorized-ports.html](https://docs.aws.amazon.com/config/latest/developerguide/vpc-sg-open-only-to-authorized-ports.html)

**Parameters:**
+ `authorizedTcpPorts` \(Optional\) – Comma\-separated list of ports to which to allow unrestricted access\. For example: `'80, 443'`\. For this rule, the default values for `authorizedTcpPorts` are 80 and 443\.

This control checks whether the security groups that are in use allow unrestricted incoming traffic\. Optionally the rule checks whether the port numbers are listed in the `authorizedTcpPorts` parameter\.
+ If the security group rule port number allows unrestricted incoming traffic, but the port number is specified in `authorizedTcpPorts`, then the control passes\. The default value for `authorizedTcpPorts` is `80, 443`\.
+ If the security group rule port number allows unrestricted incoming traffic, but the port number is not specified in `authorizedTcpPorts` input parameter, then the control fails\.
+ If the parameter is not used, then the control fails for any security group that has an unrestricted inbound rule\.

Security groups provide stateful filtering of ingress and egress network traffic to AWS\. Security group rules should follow the principal of least privileged access\. Unrestricted access \(IP address with a /0 suffix\) increases the opportunity for malicious activity such as hacking, denial\-of\-service attacks, and loss of data\.

Unless a port is specifically allowed, the port should deny unrestricted access\.

**Note**  
This control is not supported in Asia Pacific \(Osaka\)\.

### Remediation<a name="ecs-18-remediation"></a>

For information on how to modify a security group, see [Add, remove, or update rules](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html#AddRemoveRules) in the *Amazon VPC User Guide*\.

