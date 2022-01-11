## \[EC2\.19\] Security groups should not allow unrestricted access to ports with high risk<a name="fsbp-ec2-19"></a>

**Category:** Protect > Restricted network access

**Severity:** High

**Resource type:** `AWS::EC2::SecurityGroup`

**AWS Config rule:** `vpc-sg-restricted-common-ports` \(Custom rule developed by Security Hub\)

**Parameters:** None

This control checks whether unrestricted incoming traffic for the security groups is accessible to the specified ports that have the highest risk\. This control passes when none of the rules in a security group allow ingress traffic from 0\.0\.0\.0/0 for those ports\.

Unrestricted access \(0\.0\.0\.0/0\) increases opportunities for malicious activity, such as hacking, denial\-of\-service attacks, and loss of data\.

Security groups provide stateful filtering of ingress and egress network traffic to AWS resources\. No security group should allow unrestricted ingress access to the following ports:
+ 20, 21 \(FTP\)
+ 22 \(SSH\)
+ 23 \(Telnet\)
+ 25 \(SMTP\)
+ 110 \(POP3\)
+ 135 \(RPC\)
+ 143 \(IMAP\)
+ 445 \(CIFS\)
+ 1433, 1434 \(MSSQL\)
+ 3000 \(Go, Node\.js, and Ruby web development frameworks\)
+ 3306 \(mySQL\)
+ 3389 \(RDP\)
+ 4333 \(ahsp\)
+ 5000 \(Python web development frameworks\)
+ 5432 \(postgresql\)
+ 5500 \(fcp\-addr\-srvr1\) 
+ 5601 \(OpenSearch Dashboards\)
+ 8080 \(proxy\)
+ 8088 \(legacy HTTP port\)
+ 8888 \(alternative HTTP port\)
+ 9200 or 9300 \(OpenSearch\)

### Remediation<a name="ec2-19-remediation"></a>

For information on how to delete rules from a security group, see [Delete rules from a security group](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/working-with-security-groups.html#deleting-security-group-rule) in the *Amazon EC2 User Guide for Linux Instances*\.

