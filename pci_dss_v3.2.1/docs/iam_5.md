# Virtual MFA should be enabled for the root user

This control checks whether users of your AWS account require a multi-factor authentication (MFA) device to sign in with root user credentials.

It does not check whether you are using hardware MFA.

To address PCI DSS requirement 8.3.1, you can choose between virtual MFA (this control) or hardware MFA.

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
> MFA adds an extra layer of protection on top of a user name and password. If users with administrative privileges are accessing the cardholder data environment, and are not physically in front of the machine they are administering, MFA is required.
>
> Enabling virtual MFA is a method used to incorporate multi-factor authentication (MFA) for all nonconsole administrative access.

## Remediation

**To enable MFA for the root account**

1. Log in to your account using the root user credentials.
2. Choose the account name at the top-right of the page and then choose **My Security Credentials**.
3. In the warning, choose **Continue to Security Credentials**.
4. Choose **Multi-factor authentication (MFA)**.
5. Choose **Activate MFA**.
6. Choose the type of device to use for MFA and then choose **Continue**.
7. Complete the steps to configure the device type appropriate to your selection.
