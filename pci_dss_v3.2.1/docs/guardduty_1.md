# GuardDuty should be enabled

This control checks whether Amazon GuardDuty is enabled in your AWS account and Region.

While GuardDuty can be effective against attacks that an intrusion detection system would typically protect, it might not be a complete solution for every environment. This rule also does not check for the generation of alerts to personnel. For more information about GuardDuty, see the [Amazon GuardDuty User Guide](https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html).

> This control is not supported in the following Regions.
> 
> * Africa (Cape Town)
> * Asia Pacific (Osaka)
> * China (Beijing)
> * China (Ningxia)
> * Europe (Milan)
> * Middle East (Bahrain)
> * AWS GovCloud (US-East)

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements:

**PCI DSS 11.4 Use intrusion-detection and/or intrusion-prevention techniques to detect and/or prevent intrusions into the network.**

> GuardDuty can help to meet requirement 11.4 by monitoring traffic at the perimeter of the cardholder data environment and all critical points within it. It can also keep all intrusion-detection engines, baselines, and signatures up to date. Findings are generated from GuardDuty. You can send these alerts to personnel using Amazon CloudWatch. See [Creating custom responses to GuardDuty findings with Amazon CloudWatch Events](https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_findings_cloudwatch.html) in the _Amazon GuardDuty User Guide_. Not enabling GuardDuty in your AWS account might violate the requirement to use intrusion-detection and/or prevention techniques to prevent intrusions into the network.

Remediation

To remediate this issue, you enable GuardDuty.

For details on how to enable GuardDuty, including how to use AWS Organizations to manage multiple accounts, see [Getting started with GuardDuty](https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_settingup.html) in the _Amazon GuardDuty User Guide_.
