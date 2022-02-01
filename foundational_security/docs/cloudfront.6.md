## \[CloudFront\.6\] CloudFront distributions should have AWS WAF enabled

**Category:** Protect > Protective services

**Severity:** Medium

**Resource type:** `AWS::CloudFront::Distribution`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/cloudfront-associated-with-waf.html](https://docs.aws.amazon.com/config/latest/developerguide/cloudfront-associated-with-waf.html)

**Parameters:**
+ `wafWebAclIds` \(Optional\) \- A comma\-separated list of web ACL IDs \(for AWS WAF\) or web ACL ARNs \(for AWS WAFv2\)\.

This control checks whether CloudFront distributions are associated with either AWS WAF or AWS WAFv2 web ACLs\. The control fails if the distribution is not associated with a web ACL\.

AWS WAF is a web application firewall that helps protect web applications and APIs from attacks\. It allows you to configure a set of rules, called a web access control list \(web ACL\), that allow, block, or count web requests based on customizable web security rules and conditions that you define\. Ensure your CloudFront distribution is associated with an AWS WAF web ACL to help protect it from malicious attacks\.

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

### Remediation<a name="cloudfront-6-remediation"></a>

For information on how to associate a web ACL with a CloudFront distribution, see [Using AWS WAF to control access to your content](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-awswaf.html) in the *Amazon CloudFront Developer Guide*\.

