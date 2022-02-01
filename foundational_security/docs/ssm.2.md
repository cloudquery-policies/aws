## \[SSM\.2\] All EC2 instances managed by Systems Manager should be compliant with patching requirements

**Category:** Detect > Detection services 

**Severity:** High

**Resource type:** `AWS::SSM::PatchCompliance`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/ec2-managedinstance-patch-compliance-status-check.html](https://docs.aws.amazon.com/config/latest/developerguide/ec2-managedinstance-patch-compliance-status-check.html)

**Parameters:** None

This control checks whether the compliance status of the Amazon EC2 Systems Manager patch compliance is `COMPLIANT` or `NON_COMPLIANT` after the patch installation on the instance\. It only checks instances that are managed by Systems Manager Patch Manager\.

Having your EC2 instances fully patched as required by your organization reduces the attack surface of your AWS accounts\. 

**Note**  
This control is not supported in the following Regions\.  
Africa \(Cape Town\)
Europe \(Milan\)
Middle East \(Bahrain\)

### Remediation<a name="ssm-2-remediation"></a>

To remediate this issue, install the required patches on your noncompliant instances\.

**To remediate noncompliant patches**

1. Open the AWS Systems Manager console at [https://console\.aws\.amazon\.com/systems\-manager/](https://console.aws.amazon.com/systems-manager/)\.

1. Under **Node Management**, choose **Run Command** and then choose **Run command**\.

1. Choose the button next to **AWS\-RunPatchBaseline**\.

1. Change the **Operation** to **Install**\.

1. Choose **Choose instances manually** and then choose the noncompliant instances\.

1. At the bottom of the page, choose **Run**\.

1. After the command is complete, to monitor the new compliance status of your patched instances, in the navigation pane, choose **Compliance**\.

For more information about using Systems Manager documents to patch a managed instance, see[ About SSM documents for patching instances](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-ssm-documents.html) and [Running commands using Systems Manager Run command](https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html) in the *AWS Systems Manager User Guide*\.

