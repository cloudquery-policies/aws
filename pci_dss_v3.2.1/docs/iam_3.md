# IAM policies should not allow full "*" administrative privileges

This control checks whether the default version of AWS Identity and Access Management policies (also known as customer managed policies) do not have administrator access with a statement that has `"Effect": "Allow" with "Action": "*"` over `"Resource": "*"`.

It only checks for the [customer managed policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html#customer-managed-policies) that you created, but does not check for full access to individual services, such as `"S3:*"`.

It does not check for [inline and AWS managed policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html#aws-managed-policies).

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements:

**PCI DSS 7.2.1: Establish an access control system(s) for systems components that restrict access based on a user’s need to know, and is set to "deny all" unless specifically allowed. This access control system(s) must include the following: Coverage of all system components.**

> Providing full administrative privileges instead of restricting to the minimum required may violate the requirement to ensure access to systems components is restricted to the least privilege necessary, or a user’s need to know.

## Remediation

**To modify an IAM policy**

1. Open the IAM console at https://console.aws.amazon.com/iam/.
2. Choose **Policies**.
3. Choose the radio button next to the policy to remove.
4. From **Policy actions**, choose **Detach**.
5. On the **Detach policy** page, choose the radio button next to each user to detach the policy from and then choose **Detach policy**.
6. Confirm that the user that you detached the policy from can still access AWS services and resources as expected.
