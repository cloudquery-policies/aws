## \[Lambda\.1\] Lambda function policies should prohibit public access

**Category:** Protect > Secure network configuration

**Severity:** Critical

**Resource type:** `AWS::Lambda::Function`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/lambda-function-public-access-prohibited.html](https://docs.aws.amazon.com/config/latest/developerguide/lambda-function-public-access-prohibited.html)

**Parameters:** None

This control checks whether the Lambda function resource\-based policy prohibits public access outside of your account\.

The control also fails if a Lambda function is invoked from Amazon S3 and the policy does not include a condition for `AWS:SourceAccount`\.

The Lambda function should not be publicly accessible, as this may allow unintended access to your code stored in the function\.

**Note**  
This control is not supported in the China \(Beijing\) or China \(Ningxia\) Regions\.

### Remediation<a name="lambda-1-remediation"></a>

If a Lambda function fails this control, it indicates that the resource\-based policy statement for the Lambda function allows public access\.

To remediate the issue, you must update the policy to remove the permissions or to add the `AWS:SourceAccount` condition\. You can only update the resource\-based policy from the Lambda API\.

The following instructions use the console to review the policy and the AWS Command Line Interface to remove the permissions\.

**To view the resource\-based policy for a Lambda function**

1. Open the AWS Lambda console at [https://console\.aws\.amazon\.com/lambda/](https://console.aws.amazon.com/lambda/)\.

1. In the navigation pane, choose **Functions**\.

1. Choose the function\.

1. Choose **Permissions**\. The resource\-based policy shows the permissions that are applied when another account or AWS service attempts to access the function\. 

1. Examine the resource\-based policy\. Identify the policy statement that has `Principal` field values that make the policy public\. For example, allowing `"*"` or `{ "AWS": "*" }`\.

   You cannot edit the policy from the console\. To remove permissions from the function, you use the `remove-permission` command from the AWS CLI\.

   Note the value of the statement ID \(`Sid`\) for the statement that you want to remove\.

To use the AWS CLI to remove permissions from a Lambda function, issue the [https://docs.aws.amazon.com/cli/latest/reference/lambda/remove-permission.html](https://docs.aws.amazon.com/cli/latest/reference/lambda/remove-permission.html) command\.

```
$ aws lambda remove-permission --function-name <function-name> --statement-id <statement-id>
```

Replace `<function-name>` with the name of the Lambda function, and `<statement-id>` with the statement ID of the statement to remove\.

**To verify that the permissions are updated**

1. Open the AWS Lambda console at [https://console\.aws\.amazon\.com/lambda/](https://console.aws.amazon.com/lambda/)\.

1. In the navigation pane, choose **Functions**\.

1. Choose the function that you updated\.

1. Choose **Permissions**\.

   The resource\-based policy should be updated\. If there was only one statement in the policy, then the policy is empty\.

For more information, see [Using resource\-based policies for AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html) in the *AWS Lambda Developer Guide*\.

