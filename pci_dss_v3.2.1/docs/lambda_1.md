# Lambda functions should prohibit public access

This control checks whether the Lambda function resource-based policy prohibits public access.

It does not check for access to the Lambda function by internal principals, such as IAM roles. You should ensure that access to the Lambda function is restricted to authorized principals only by using least privilege Lambda resource-based policies.

For more information about using resource-based policies for AWS Lambda, see the [AWS Lambda Developer Guide](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html).

> This control is not supported in the following Regions.
>
> * Asia Pacific (Osaka)
> * China (Beijing)
> * China (Ningxia)

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements:

**PCI DSS 1.2.1: Restrict inbound and outbound traffic to that which is necessary for the cardholder data environment (CDE), and specifically deny all other traffic.**

> If you use a Lambda function that is in scope for PCI DSS, the function should not be publicly accessible. A publicly accessible function might violate the requirement to allow only necessary traffic to and from the CDE.

**PCI DSS 1.3.1: Implement a DMZ to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports.**

> If you use a Lambda function that is in scope for PCI DSS, the function should not be publicly accessible. A publicly accessible function might violate the requirement to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports.

**PCI DSS 1.3.2: Limit inbound internet traffic to IP addresses within the DMZ.**

> If you use a Lambda function that is in scope for PCI DSS, the function should not be publicly accessible. A publicly accessible function might violate the requirement to limit inbound internet traffic to IP addresses within the DMZ.

**PCI DSS 1.3.4: Do not allow unauthorized outbound traffic from the cardholder data environment to the internet.**

> If you use a Lambda function that is in scope for PCI DSS, the function must not be publicly accessible. A publicly accessible function might violate the requirement to block unauthorized outbound traffic from the cardholder data environment to the internet.

**PCI DSS 7.2.1: Establish an access control system(s) for systems components that restricts access based on a user’s need to know, and is set to "deny all" unless specifically allowed. This access control system(s) must include the following: Coverage of all system components.**

> If you use a Lambda function that is in scope for PCI DSS, the function should not be publicly accessible. A publicly accessible function might violate the requirement to ensure access to systems components that contain cardholder data is restricted to the least privilege necessary, or a user’s need to know.

## Remediation

To remediate this issue, you update the resource-based policy to change the publicly accessible Lambda function to a private Lambda function.

You can only update resource-based policies for Lambda resources within the scope of the AddPermission and AddLayerVersionPermission API actions.

You cannot author policies for your Lambda resources in JSON, or use conditions that don't map to parameters for those actions using the CLI or the SDK.

**To use the AWS CLI to revoke function-use permission from an AWS service or another account**

1. To get the ID of the statement from the output of GetPolicy, from the AWS CLI, run the following:

    `aws lambda get-policy —function-name yourfunctionname`

    This command returns the Lambda resource-based policy string associated with the publicly accessible Lambda function.

2. From the policy statement returned by the `get-policy` command, copy the string value of the `Sid` field.
3. From the AWS CLI, run

    `aws lambda remove-permission --function-name yourfunctionname —statement-id youridvalue`

**To use the Lambda console to restrict access to the Lambda function**

1. Open the AWS Lambda console at https://console.aws.amazon.com/lambda/.
2. Navigate to **Functions** and then select your publicly accessible Lambda function.
3. Under **Designer**, choose the key icon at the top left. It has the tool-tip **View permissions**.
4. Under **Function policy**, if the policy allows actions for the principal element `"*"` or `{"AWS": "*"}`, it is publicly accessible.

    Consider adding the following IAM condition to scope access to your account only.

        "Condition": {
          "StringEquals": {
            "AWS:SourceAccount": "<account_id>"
             }
          }
        }

For other Lambda resource-based policies examples that allow you to grant usage permission to other accounts on a per-resource basis, see the information on using resource-based policies for AWS Lambda in the [AWS Lambda Developer Guide](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html).
