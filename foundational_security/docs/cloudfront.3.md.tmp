## \[CloudFront\.3\] CloudFront distributions should require encryption in transit<a name="fsbp-cloudfront-3"></a>

**Category:** Protect > Data protection > Encryption of data in transit

**Severity:** Medium

**Resource type:** `AWS::CloudFront::Distribution`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/cloudfront-viewer-policy-https.html](https://docs.aws.amazon.com/config/latest/developerguide/cloudfront-viewer-policy-https.html)

**Parameters:** None

This control checks whether an Amazon CloudFront distribution requires viewers to use HTTPS directly or whether it uses redirection\. The control fails if `ViewerProtocolPolicy` is set to `allow-all` for `defaultCacheBehavior` or for `cacheBehaviors`\.

HTTPS \(TLS\) can be used to help prevent potential attackers from using person\-in\-the\-middle or similar attacks to eavesdrop on or manipulate network traffic\. Only encrypted connections over HTTPS \(TLS\) should be allowed\. Encrypting data in transit can affect performance\. You should test your application with this feature to understand the performance profile and the impact of TLS\.

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

### Remediation<a name="cloudfront-3-remediation"></a>

For detailed remediation instructions, see [Requiring HTTPS for communication between viewers and CloudFront](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https-viewers-to-cloudfront.html) in the *Amazon CloudFront Developer Guide*\.

