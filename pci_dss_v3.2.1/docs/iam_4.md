# Hardware MFA should be enabled for the root user

This control checks whether your AWS account is enabled to use multi-factor authentication (MFA) hardware device to sign in with root user credentials.

It does not check whether you are using virtual MFA.

To address PCI DSS requirement 8.3.1, you can choose between hardware MFA (this control) or virtual MFA.

> This control is not supported in the following Regions.
>
> * China (Beijing)
> * China (Ningxia)
> * AWS GovCloud (US-East)
> * AWS GovCloud (US-West)

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements:

**PCI DSS 8.3.1: Incorporate multi-factor authentication for all non-console access into the cardholder data environment (CDE) for personnel with administrative access.**

> The root user is the most privileged user in an account.
>
> MFA adds an extra layer of protection on top of a user name and password. If users with administrative privileges are accessing the cardholder data environment over a network interface rather than via a direct, physical connection to the system component, and are not physically in front of the machine they are administering, MFA is required.
>
> Enabling hardware MFA is a method used to incorporate multi-factor authentication (MFA) for all nonconsole administrative access

## Remediation

**To enable hardware-based MFA for the root account**

1. Log in to your account using the root user credentials.
2. Choose the account name at the top right of the page and then choose **My Security Credentials**.
3. In the warning, choose **Continue to Security Credentials**.
4. Choose **Multi-factor authentication (MFA)**.
5. Choose **Activate MFA**.
6. Choose a hardware-based (not virtual) device to use for MFA and then choose **Continue**.
7. Complete the steps to configure the device type appropriate to your selection.
