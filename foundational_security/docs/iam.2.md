## \[IAM\.2\] IAM users should not have IAM policies attached

**Category:** Protect > Secure access management

**Severity:** Low

**Resource type:** `AWS::IAM::User`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/iam-user-no-policies-check.html](https://docs.aws.amazon.com/config/latest/developerguide/iam-user-no-policies-check.html)

**Parameters:** None

This control checks that none of your IAM users have policies attached\. Instead, IAM users must inherit permissions from IAM groups or roles\.

By default, IAM users, groups, and roles have no access to AWS resources\. IAM policies grant privileges to users, groups, or roles\. We recommend that you apply IAM policies directly to groups and roles but not to users\. Assigning privileges at the group or role level reduces the complexity of access management as the number of users grows\. Reducing access management complexity might in turn reduce the opportunity for a principal to inadvertently receive or retain excessive privileges\. 

Note that this control also generates failed findings for IAM users that are created by Amazon Simple Email Service \(Amazon SES\)\. Amazon SES generates users that have inline policies attached\. You can suppress these findings\.

### Remediation<a name="iam-2-remediation"></a>

To resolve this issue, create an IAM group, assign the policy to the group, and then add the users to the group\. The policy is applied to each user in the group\.

**To create an IAM group**

1. Open the IAM console at [https://console\.aws\.amazon\.com/iam/](https://console.aws.amazon.com/iam/)\.

1. Choose **Groups** and then choose **Create New Group**\.

1. Enter a name for the group to create and then choose **Next Step**\.

1. Select each policy to assign to the group and then choose **Next Step**\. The policies that you choose should include any policies currently attached directly to a user account\.

1. Add users to a group and then assign the policies to that group\. Each user in the group is then assigned the policies that are assigned to the group\.

1. Confirm the details on the **Review** page and then choose **Create Group**\.

For more information about creating groups, see [Creating IAM groups](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_groups_create.html) in the *IAM User Guide*\.

**To add users to an IAM group**

1. Open the IAM console at [https://console\.aws\.amazon\.com/iam/](https://console.aws.amazon.com/iam/)\.

1. Choose **Groups**\.

1. Choose **Group Actions** and then choose **Add Users to Group**\.

1. Select the users to add to the group and then choose **Add Users**\.

For more information about adding users to groups, see [Adding and removing users in an IAM group](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_groups_manage_add-remove-users.html) in the *IAM User Guide*\.

**To remove a policy attached directly to a user**

1. Open the IAM console at [https://console\.aws\.amazon\.com/iam/](https://console.aws.amazon.com/iam/)\.

1. Choose **Users**\.

1. For the user to detach a policy from, choose the name in the **User name** column\.

1. For each policy listed under **Attached directly**, choose the **X** on the right side of the page to remove the policy from the user and then choose **Remove**\.

1. Confirm that the user can still use AWS services as expected\.

