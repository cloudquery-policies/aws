## \[CloudFront\.2\] CloudFront distributions should have origin access identity enabled

**Category:** Protect > Secure access management > Resource policy configuration

**Severity:** Medium

**Resource type:** `AWS::CloudFront::Distribution`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/cloudfront-origin-access-identity-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/cloudfront-origin-access-identity-enabled.html)

**Parameters:** None

This control checks whether an Amazon CloudFront distribution with Amazon S3 Origin type has Origin Access Identity \(OAI\) configured\. The control fails if OAI is not configured\.

CloudFront OAI prevents users from accessing S3 bucket content directly\. When users access an S3 bucket directly, they effectively bypass the CloudFront distribution and any permissions that are applied to the underlying S3 bucket content\.

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

### Remediation<a name="cloudfront-2-remediation"></a>

For detailed remediation instructions, see [Creating a CloudFront OAI and adding it to your distribution](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html#private-content-creating-oai) in the *Amazon CloudFront Developer Guide*\.

