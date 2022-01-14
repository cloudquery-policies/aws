# MFA should be enabled for all IAM users

This control checks whether the IAM users have multi-factor authentication (MFA) enabled.

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements:

**PCI DSS 8.3.1: Incorporate multi-factor authentication for all non-console access into the cardholder data environment (CDE) for personnel with administrative access.**

> Enabling MFA for all IAM users is a method used to incorporate multi-factor authentication (MFA) for all nonconsole administrative access.

## Remediation

**To configure MFA for a user**

1. Open the IAM console at https://console.aws.amazon.com/iam/.
2. Choose **Users**.
3. Choose the user name of the user to configure MFA for.
4. Choose **Security credentials** and then choose **Manage** next to **Assigned MFA device**.
5. Follow the **Manage MFA Device** wizard to assign the type of device appropriate for your environment.
