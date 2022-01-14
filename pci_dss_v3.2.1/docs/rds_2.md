# RDS DB Instances should prohibit public access

This control checks whether RDS instances are publicly accessible by evaluating the `publiclyAccessible` field in the instance configuration item. The value of `publiclyAccessible` indicates whether the DB instance is publicly accessible. When the DB instance is publicly accessible, it is an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address. When the DB instance isn't publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address.

The control does not check VPC subnet routing settings or the Security Group rules. You should also ensure VPC subnet routing does not allow public access, and that the security group inbound rule associated with the RDS instance does not allow unrestricted access (0.0.0.0/0). You should also ensure that access to your RDS instance configuration is limited to only authorized users by restricting users' IAM permissions to modify RDS instances settings and resources.

For more information, see [Hiding a DB instance in a VPC from the Internet](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_VPC.WorkingWithRDSInstanceinaVPC.html#USER_VPC.Hiding) in the _Amazon RDS User Guide_.

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements:

**PCI DSS 1.2.1: Restrict inbound and outbound traffic to that which is necessary for the cardholder data environment (CDE), and specifically deny all other traffic.**

> If you use an RDS instance that is in scope for PCI DSS, the RDS instance should not be publicly accessible. Allowing this might violate the requirement to allow only necessary traffic to and from the CDE.

**PCI DSS 1.3.1: Implement a DMZ to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports.**

> If you use an RDS instance to store cardholder data, the RDS instance should not be publicly accessible. Allowing this might violate the requirement to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports.

**PCI DSS 1.3.2: Limit inbound internet traffic to IP addresses within the DMZ.**

> If you use an RDS instance to store cardholder data, the RDS instance should not be publicly accessible as this might violate the requirement to limit inbound internet traffic to IP addresses within the DMZ.

**PCI DSS 1.3.4: Do not allow unauthorized outbound traffic from the cardholder data environment to the internet.**

> If you use an RDS instance to store cardholder data, the RDS instance should not be publicly accessible. Allowing this might violate the requirement to block unauthorized outbound traffic from the cardholder data environment to the internet.

**PCI DSS 1.3.6: Place system components that store cardholder data (such as a database) in an internal network zone, segregated from the DMZ and other untrusted networks.**

> If you use an RDS instance to store cardholder data, the RDS instance should not be publicly accessible. Allowing this may violate the requirement to place system components that store cardholder data in an internal network zone, segregated from the DMZ and other untrusted networks.

**PCI DSS 7.2.1: Establish an access control system(s) for systems components that restricts access based on a user’s need to know, and is set to “deny all” unless specifically allowed. This access control system(s) must include the following: Coverage of all system components.**

> If you use an RDS instance to store cardholder data, the RDS instance should not be publicly accessible, as this may violate the requirement to ensure access to systems components that contain cardholder data is restricted to least privilege necessary, or a user’s need to know.

## Remediation

**To remove public access for Amazon RDS Databases**

1. Open the Amazon RDS console at https://console.aws.amazon.com/rds/.
2. Navigate to **Databases** and then choose your public database.
3. Choose **Modify**.
4. Scroll to **Network & Security**.
5. For **Public accessibility**, choose **No**.
6. Scroll to the bottom and then choose **Continue**.
7. Under **Scheduling of modifications**, choose **Apply immediately**.
8. Choose **Modify DB Instance**.
