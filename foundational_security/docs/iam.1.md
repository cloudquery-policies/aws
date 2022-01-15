## \[IAM\.1\] IAM policies should not allow full "\*" administrative privileges<a name="fsbp-iam-1"></a>

**Category:** Protect > Secure access management

**Severity:** High

**Resource type:** `AWS::IAM::Policy`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/iam-policy-no-statements-with-admin-access.html](https://docs.aws.amazon.com/config/latest/developerguide/iam-policy-no-statements-with-admin-access.html)

**Parameters:** None

This control checks whether the default version of IAM policies \(also known as customer managed policies\) has administrator access that includes a statement with "Effect": "Allow" with "Action": "\*" over "Resource": "\*"\.

The control only checks the customer managed policies that you create\. It does not check inline and AWS managed policies\.

IAM policies define a set of privileges that are granted to users, groups, or roles\. Following standard security advice, AWS recommends that you grant least privilege, which means to grant only the permissions that are required to perform a task\. When you provide full administrative privileges instead of the minimum set of permissions that the user needs, you expose the resources to potentially unwanted actions\.

Instead of allowing full administrative privileges, determine what users need to do and then craft policies that let the users perform only those tasks\. It is more secure to start with a minimum set of permissions and grant additional permissions as necessary\. Do not start with permissions that are too lenient and then try to tighten them later\.

You should remove IAM policies that have a statement with `"Effect": "Allow" `with `"Action": "*"` over `"Resource": "*"`\.

### Remediation<a name="iam-1-remediation"></a>

To remediate this issue, update your IAM policies so that they do not allow full "\*" administrative privileges\.

**To modify an IAM policy**

1. Open the IAM console at [https://console\.aws\.amazon\.com/iam/](https://console.aws.amazon.com/iam/)\.

1. Choose **Policies**\.

1. Choose the button next to the policy to remove\.

1. From **Policy actions**, choose **Detach**\.

1. For each user to detach the policy from, choose the button next to the user, then choose **Detach policy**\.

Confirm that the user that you detached the policy from can still access AWS services and resources as expected\.

