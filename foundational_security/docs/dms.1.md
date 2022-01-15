## \[DMS\.1\] AWS Database Migration Service replication instances should not be public<a name="fsbp-dms-1"></a>

**Category:** Protect > Secure network configuration

**Severity:** Critical

**Resource type:** `AWS::DMS::ReplicationInstance`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/dms-replication-not-public.html](https://docs.aws.amazon.com/config/latest/developerguide/dms-replication-not-public.html)

**Parameters:** None

This control checks whether AWS DMS replication instances are public\. To do this, it examines the value of the `PubliclyAccessible` field\.

A private replication instance has a private IP address that you cannot access outside of the replication network\. A replication instance should have a private IP address when the source and target databases are in the same network\. The network must also be connected to the replication instance's VPC using a VPN, AWS Direct Connect, or VPC peering\. To learn more about public and private replication instances, see [Public and private replication instances](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.PublicPrivate) in the *AWS Database Migration Service User Guide*\.

You should also ensure that access to your AWS DMS instance configuration is limited to only authorized users\. To do this, restrict users’ IAM permissions to modify AWS DMS settings and resources\.

**Note**  
This control is not supported in Africa \(Cape Town\) or Europe \(Milan\)\.

### Remediation<a name="dms-1-remediation"></a>

Note that you cannot change the public access setting once a replication instance is created\. It must be deleted and recreated\.

**To configure the AWS DMS replication instances setting to block public access**

1. Open the AWS Database Migration Service console at [https://console\.aws\.amazon\.com/dms/](https://console.aws.amazon.com/dms/)\.

1. Navigate to** Replication instances**, then delete the public instance\. Choose the instance, choose **Actions**, then choose **delete**\.

1. Choose **Create replication instance**\. Provide the configuration details\.

1. To disable public access, make sure that **Publicly accessible** is not selected\.

1. Choose **Create**\.

For more information, see the section on [Creating a replication instance](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.Creating) in the *AWS Database Migration Service User Guide*\.

