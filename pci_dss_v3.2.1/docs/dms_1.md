# AWS Database Migration Service replication instances should not be public

This control checks whether AWS DMS replication instances are public. To do this, it examines the value of the `PubliclyAccessible` field.

A private replication instance has a private IP address that you cannot access outside of the replication network. A replication instance should have a private IP address when the source and target databases are in the same network, and the network is connected to the replication instance's VPC using a VPN, AWS Direct Connect, or VPC peering. To learn more about public and private replication instances, see [Public and private replication instances](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.PublicPrivate) in the _AWS Database Migration Service User Guide_.

You should also ensure that access to your AWS DMS instance configuration is limited to only authorized users. To do this, restrict users’ IAM permissions to modify AWS DMS settings and resources.

> This control is not supported in the following Regions.
>
> * Africa (Cape Town)
> * Asia Pacific (Osaka)
> * Europe (Milan)

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements.

**PCI DSS 1.2.1 - Restrict inbound and outbound traffic to that which is necessary for the cardholder data environment (CDE), and specifically deny all other traffic.**

> If you use AWS DMS in your defined CDE, set the replication instance’s `PubliclyAccessible` field to `'false'`. Allowing public access to your replication instance might violate the requirement to allow only necessary traffic to and from the CDE.

**PCI DSS 1.3.1 - Implement a DMZ to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports.**

> If you use AWS DMS in your defined CDE, set the replication instance’s `PubliclyAccessible` field to `'false'`. Allowing public access to your replication instance might violate the requirement to limit inbound traffic to only system components that provide authorized, publicly accessible services, protocols, and ports.

**PCI DSS 1.3.2 - Limit inbound internet traffic to IP addresses within the DMZ.**

> If you use AWS DMS in your defined CDE, set the replication instance’s `PubliclyAccessible` field to `'false'`. Allowing public access to your replication instance might violate the requirement to limit inbound traffic to IP addresses within the DMZ.

**PCI DSS 1.3.4 Do not allow unauthorized outbound traffic from the cardholder data environment to the internet.**

> If you use AWS DMS in your defined CDE, set the replication instance’s `PubliclyAccessible` field to `'false'`. Allowing public access to your replication instance might violate the requirement to block unauthorized outbound traffic from the cardholder data environment to the internet.

**PCI DSS 1.3.6 Place system components that store cardholder data (such as a database) in an internal network zone, segregated from the DMZ and other untrusted networks.**

> If you use AWS DMS in your defined CDE, to migrate a database storing cardholder data, set the replication instance’s `PubliclyAccessible` field to `'false'`. Allowing public access to your replication instance might violate the requirement to place system components that store cardholder data in an internal network zone, segregated from the DMZ and other untrusted networks.

## Remediation

Note that you cannot change the public access setting once a replication instance is created. It must be deleted and recreated.

**To configure the AWS DMS replication instances setting to be not publicly accessible**

1. Open the AWS Database Migration Service console at https://console.aws.amazon.com/dms/.
2. In the left navigation pane, under **Resource management**, navigate to **Replication instances**.
3. To delete the public instance, select the check box for the instance, choose **Actions**, then choose **delete**.
4. Choose **Create replication instance**. Provide the configuration details.
5. To disable public access, make sure that **Publicly accessible** is not selected.
6. Choose **Create**.
