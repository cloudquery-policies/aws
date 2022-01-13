# RDS snapshots should prohibit public access

This control checks whether Amazon RDS DB snapshots prohibit access by other accounts. You should also ensure that access to the snapshot and permission to change Amazon RDS configuration is restricted to authorized principals only.

To learn more about sharing DB snapshots in Amazon RDS, see the [Amazon RDS User Guide](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ShareSnapshot.html).

Note that if the configuration is changed to allow public access, the AWS Config rule may not be able to detect the change for up to 12 hours. Until the AWS Config rule detects the change, the check passes even though the configuration violates the rule.

> This control is not supported in the following Regions.
>
> * Africa (Cape Town)
> * Asia Pacific (Osaka)
> * Europe (Milan)

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements:

**PCI DSS 1.2.1: Restrict inbound and outbound traffic to that which is necessary for the cardholder data environment (CDE), and specifically deny all other traffic.**

> RDS snapshots are used to back up the data on your RDS instances at a specific point in time. They can be used to restore previous states of RDS instances.
>
> If an RDS snapshot stores cardholder data, the RDS snapshot should not be shared by other accounts. Sharing the RDS snapshot would allow other accounts to restore an RDS instance from the snapshot. Allowing this so might violate the requirement to allow only necessary traffic to and from the CDE.

**PCI DSS 1.3.1: Implement a DMZ to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports.**

> RDS snapshots are used to back up the data on your RDS instances at a specific point in time. They can be used to restore previous states of RDS instances.
>
> If an RDS snapshot stores cardholder data, the RDS snapshot should not be shared by other accounts. Sharing the RDS snapshot would allow other accounts to restore an RDS instance from the snapshot. Allowing this might violate the requirement to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports.

**PCI DSS 1.3.4: Do not allow unauthorized outbound traffic from the cardholder data environment to the internet.**

> RDS snapshots are used to back up the data on your RDS instances at a specific point in time. They can be used to restore previous states of RDS instances.
>
> If an RDS snapshot stores cardholder data, the RDS snapshot should not be shared by other accounts. Sharing the RDS snapshot would allow other accounts to restore an RDS instance from the snapshot. Allowing this might violate the requirement to block unauthorized outbound traffic from the cardholder data environment to the internet.

**PCI DSS 1.3.6: Place system components that store cardholder data (such as a database) in an internal network zone, segregated from the DMZ and other untrusted networks.**

> RDS snapshots are used to back up the data on your RDS instances at a specific point in time. They can be used to restore previous states of RDS instances.
>
> If an RDS snapshot stores cardholder data, the RDS snapshot should not be shared by other accounts. Sharing the RDS snapshot would allow other accounts to restore an RDS instance from the snapshot. Allowing this might violate the requirement to place system components that store cardholder data in an internal network zone, segregated from the DMZ and other untrusted networks.

**PCI DSS 7.2.1: Establish an access control system(s) for systems components that restricts access based on a user’s need to know, and is set to "deny all" unless specifically allowed. This access control system(s) must include the following: Coverage of all system components.**

> RDS snapshots are used to back up the data on your RDS instances at a specific point in time. They can be used to restore previous states of RDS instances.
>
> If an RDS snapshot stores cardholder data, the RDS snapshot should not be shared by other accounts. Sharing the RDS snapshot would allow other accounts to restore an RDS instance from the snapshot. Allowing this might violate the requirement to ensure access to systems components that contain cardholder data is restricted to least privilege necessary, or a user's need to know.

## Remediation

**To remove public access for Amazon RDS Snapshots**

1. Open the Amazon RDS console at https://console.aws.amazon.com/rds/.
2. Navigate to **Snapshots** and then select the public Snapshot you want to modify
3. From the **Actions** list, choose **Share Snapshots**
4. From **DB snapshot visibility**, choose **Private**
5. Under **DB snapshot visibility**, select **for all**
6. Choose **Save**
