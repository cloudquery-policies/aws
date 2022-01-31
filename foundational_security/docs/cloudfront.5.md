## \[CloudFront\.5\] CloudFront distributions should have logging enabled

**Category:** Identify > Logging

**Severity:** Medium

**Resource type:** `AWS::CloudFront::Distribution`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/cloudfront-accesslogs-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/cloudfront-accesslogs-enabled.html)

**Parameters:**
+ `S3BucketName` \(Optional\) – The S3 bucket to send the logs to

This control checks whether server access logging is enabled on CloudFront distributions\. The control fails if access logging is not enabled for a distribution\.

CloudFront access logs provide detailed information about every user request that CloudFront receives\. Each log contains information such as the date and time the request was received, the IP address of the viewer that made the request, the source of the request, and the port number of the request from the viewer\.

These logs are useful for applications such as security and access audits and forensics investigation\. For additional guidance on how to analyze access logs, see [Querying Amazon CloudFront logs](https://docs.aws.amazon.com/athena/latest/ug/cloudfront-logs.html) in the *Amazon Athena User Guide*\.

**Note**  
This control is only supported in US East \(N\. Virginia\)\. It is not supported in the following Regions:  
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

### Remediation<a name="cloudfront-5-remediation"></a>

For information on how to configure access logging for a CloudFront distribution, see [Configuring and using standard logs \(access logs\)](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html) in the *Amazon CloudFront Developer Guide*\.

