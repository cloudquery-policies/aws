## \[GuardDuty\.1\] GuardDuty should be enabled<a name="fsbp-guardduty-1"></a>

**Category:** Detect > Detection services 

**Severity:** High

**Resource type:** AWS account

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/guardduty-enabled-centralized.html](https://docs.aws.amazon.com/config/latest/developerguide/guardduty-enabled-centralized.html)

**Parameters:** None

This control checks whether Amazon GuardDuty is enabled in your GuardDuty account and Region\.

It is highly recommended that you enable GuardDuty in all supported AWS Regions\. Doing so allows GuardDuty to generate findings about unauthorized or unusual activity, even in Regions that you do not actively use\. This also allows GuardDuty to monitor CloudTrail events for global AWS services such as IAM\.

**Note**  
This control is not supported in the following Regions\.  
Africa \(Cape Town\)
China \(Beijing\)
China \(Ningxia\)
Europe \(Milan\)
Middle East \(Bahrain\)
 AWS GovCloud \(US\-East\)

### Remediation<a name="guardduty-1-remediation"></a>

To remediate this issue, you enable GuardDuty\.

For details on how to enable GuardDuty, including how to use AWS Organizations to manage multiple accounts, see [Getting started with GuardDuty](https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_settingup.html) in the *Amazon GuardDuty User Guide*\.

