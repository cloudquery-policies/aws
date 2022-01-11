## \[IAM\.21\] IAM customer managed policies that you create should not allow wildcard actions for services<a name="fsbp-iam-21"></a>

**Category:** Detect > Secure access management 

**Severity:** Low

**Resource type:** `AWS::IAM::Policy`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/iam-policy-no-statements-with-full-access.html](https://docs.aws.amazon.com/config/latest/developerguide/iam-policy-no-statements-with-full-access.html)

**Parameters:** None

This control checks whether the IAM identity\-based policies that you create have Allow statements that use the \* wildcard to grant permissions for all actions on any service\. The control fails if any policy statement includes `"Effect": "Allow"` with `"Action": "Service:*"`\. 

For example, the following statement in a policy results in a failed finding\.

```
"Statement": [
{
  "Sid": "EC2-Wildcard",
  "Effect": "Allow",
  "Action": "ec2:*",
  "Resource": "*"
}
```

The control also fails if you use `"Effect": "Allow"` with `"NotAction": "service:*"`\. In that case, the `NotAction` element provides access to all of the actions in an AWS service, except for the actions specified in `NotAction`\.

This control only applies to customer managed IAM policies\. It does not apply to IAM policies that are managed by AWS\.

When you assign permissions to AWS services, it is important to scope the allowed IAM actions in your IAM policies\. You should restrict IAM actions to only those actions that are needed\. This helps you to provision least privilege permissions\. Overly permissive policies might lead to privilege escalation if the policies are attached to an IAM principal that might not require the permission\.

In some cases, you might want to allow IAM actions that have a similar prefix, such as `DescribeFlowLogs` and `DescribeAvailabilityZones`\. In these authorized cases, you can add a suffixed wildcard to the common prefix\. For example, `ec2:Describe*`\.

This control passes if you use a prefixed IAM action with a suffixed wildcard\. For example, the following statement in a policy results in a passed finding\.

```
"Statement": [
{
  "Sid": "EC2-Wildcard",
  "Effect": "Allow",
  "Action": "ec2:Describe*",
  "Resource": "*"
}
```

When you group related IAM actions in this way, you can also avoid exceeding the IAM policy size limits\.

**Note**  
This control is not supported in the following Regions:  
Asia Pacific \(Osaka\)
China \(Beijing\)
China \(Ningxia\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="iam-21-remediation"></a>

To remediate this issue, update your IAM policies so that they do not allow full "\*" administrative privileges\.

For details on how to edit an IAM policy, see [Editing IAM policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-edit.html) in the *IAM User Guide*\.

