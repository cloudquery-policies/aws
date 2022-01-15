## \[CloudFront\.1\] CloudFront distributions should have a default root object configured<a name="fsbp-cloudfront-1"></a>

**Category:** Protect > Secure access management > Resources not publicly accessible

**Severity:** Critical

**Resource type:** `AWS::CloudFront::Distribution`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/cloudfront-default-root-object-configured.html](https://docs.aws.amazon.com/config/latest/developerguide/cloudfront-default-root-object-configured.html)

**Parameters:** None

This control checks whether an Amazon CloudFront distribution is configured to return a specific object that is the default root object\. The control fails if the CloudFront distribution does not have a default root object configured\.

A user might sometimes request the distribution’s root URL instead of an object in the distribution\. When this happens, specifying a default root object can help you to avoid exposing the contents of your web distribution\.

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

### Remediation<a name="cloudfront-1-remediation"></a>

For detailed instructions on how to specify a default root object for your distribution, see [How to specify a default root object](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/DefaultRootObject.html#DefaultRootObjectHowToDefine) in the *Amazon CloudFront Developer Guide*\.

