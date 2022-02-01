## \[Lambda\.2\] Lambda functions should use supported runtimes

**Category:** Protect > Secure development

**Severity:** Medium

**Resource type:** `AWS::Lambda::Function`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/lambda-function-settings-check.html](https://docs.aws.amazon.com/config/latest/developerguide/lambda-function-settings-check.html)

**Parameters:** 
+ `runtime`: `nodejs14.x, nodejs12.x, python3.9, python3.8, python3.7, python3.6, ruby2.7, java11, java8, java8.al2, go1.x, dotnetcore3.1`

This control checks that the Lambda function settings for runtimes match the expected values set for the supported runtimes for each language\. This control checks for the following runtimes: `nodejs14.x`, `nodejs12.x`, `python3.9`, `python3.8`, `python3.7`, `python3.6`, `ruby2.7`, `java11`, `java8`, `java8.al2`, `go1.x`, `dotnetcore3.1`

The AWS Config rule ignores functions that have a package type of `Image`\.

[Lambda runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) are built around a combination of operating system, programming language, and software libraries that are subject to maintenance and security updates\. When a runtime component is no longer supported for security updates, Lambda deprecates the runtime\. Even though you cannot create functions that use the deprecated runtime, the function is still available to process invocation events\. Make sure that your Lambda functions are current and do not use out\-of\-date runtime environments\.

To learn more about the supported runtimes that this control checks for the supported languages, see [AWS Lambda runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) in the *AWS Lambda Developer Guide*\.

**Note**  
This control is not supported in the China \(Beijing\) or China \(Ningxia\) Regions\.

### Remediation<a name="lambda-2-remediation"></a>

For more information on supported runtimes and deprecation schedules, see the [Runtime support policy](https://docs.aws.amazon.com/lambda/latest/dg/runtime-support-policy.html) section of the *AWS Lambda Developer Guide*\. When you migrate your runtimes to the latest version, follow the syntax and guidance from the publishers of the language\.

