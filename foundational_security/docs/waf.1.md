## \[WAF\.1\] AWS WAF Classic global web ACL logging should be enabled

**Category:** Identify > Logging

**Severity:** Medium

**Resource type:** `AWS::WAF::WebACL`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/waf-classic-logging-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/waf-classic-logging-enabled.html)

**Parameters:** None

This control checks whether logging is enabled for an AWS WAF global Web ACL\. This control fails if logging is not enabled for the web ACL\.

Logging is an important part of maintaining the reliability, availability, and performance of AWS WAF globally\. It is a business and compliance requirement in many organizations, and allows you to troubleshoot application behavior\. It also provides detailed information about the traffic that is analyzed by the web ACL that is attached to AWS WAF\.

NOTE

**Note**  
This control is not supported in the following Regions:  
US East \(Ohio\)
US West \(N\. California\)
US West \(Oregon\)
Africa \(Cape Town\)
Asia Pacific \(Hong Kong\)
Asia Pacific \(Mumbai\)
Asia Pacific \(Osaka\)
Asia Pacific \(Seoul\)
Asia Pacific \(Singapore\)
Asia Pacific \(Sydney\)
Asia Pacific \(Tokyo\)
Canada \(Central\)
China \(Beijing\)
China \(Ningxia\)
Europe \(Frankfurt\)
Europe \(Ireland\)
Europe \(London\)
Europe \(Milan\)
Europe \(Paris\)
Europe \(Stockholm\)
Middle East \(Bahrain\)
South America \(São Paulo\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="waf-1-remediation"></a>

You can enable logging for a web ACL from the Kinesis Data Firehose console\.

**To enable logging for a web ACL**

1. Open the Kinesis Data Firehose console at [https://console\.aws\.amazon\.com/firehose/](https://console.aws.amazon.com/firehose/)\.

1. Create a Kinesis Data Firehose delivery stream\.

   The name must start with the prefix `aws-waf-logs`\-\. For example, `aws-waf-logs-us-east-2-analytics`\.

   Create the Kinesis Data Firehose delivery stream with a `PUT` source and in the Region where you operate\. If you capture logs for Amazon CloudFront, create the delivery stream in US East \(N\. Virginia\)\. For more information, see [Creating an Amazon Kinesis Data Firehose delivery stream](https://docs.aws.amazon.com/firehose/latest/dev/basic-create.html) in the *Amazon Kinesis Data Firehose Developer Guide*\.

1. From **Services**, choose **WAF & Shield**\. Then choose **Switch to AWS WAF Classic**\.

1. From **Filter**, choose **Global \(CloudFront\)**\.

1. Choose the web ACL to enable logging for\.

1. Under **Logging**, choose **Enable logging**\.

1. Choose the Kinesis Data Firehose delivery stream that you created earlier\. You must choose a delivery stream that has a name that begins with `aws-waf-logs`\-\.

1. Choose **Enable logging**\.