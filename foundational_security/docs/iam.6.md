## \[IAM\.6\] Hardware MFA should be enabled for the root user

**Category:** Protect > Secure access management

**Severity:** Critical

**Resource type:** AWS account

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/root-account-hardware-mfa-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/root-account-hardware-mfa-enabled.html)

**Parameters:** None

This control checks whether your AWS account is enabled to use a hardware multi\-factor authentication \(MFA\) device to sign in with root user credentials\.

Virtual MFA might not provide the same level of security as hardware MFA devices\. We recommend that you use only a virtual MFA device while you wait for hardware purchase approval or for your hardware to arrive\. To learn more, see[ Enabling a virtual multi\-factor authentication \(MFA\) device \(console\)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_enable_virtual.html) in the *IAM User Guide*\.

**Note**  
This control is not supported in the following Regions\.  
China \(Beijing\)
China \(Ningxia\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)\.

### Remediation<a name="iam-6-remediation"></a>

To remediate this issue, add hardware\-based MFA to the root account\.

**To enable hardware\-based MFA for the root account**

1. Log in to your account using the root user credentials\.

1. Choose the account name near the top\-right corner of the page and then choose **My Security Credentials**\.

1. In the pop\-up warning, choose **Continue to Security Credentials**\.

1. Choose **Multi\-Factor Authentication \(MFA\)**\.

1. Choose **Activate MFA**\.

1. Choose a hardware\-based \(not virtual\) device to use for MFA and then choose **Continue**\.

1. Complete the steps to configure the device type appropriate to your selection\.

