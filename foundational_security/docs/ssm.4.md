## \[SSM\.4\] SSM documents should not be public

**Category:** Protect > Secure network configuration > Resources not publicly accessible

**Severity:** Critical

**Resource type:** `AWS::SSM::Document`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/ssm-document-not-public.html](https://docs.aws.amazon.com/config/latest/developerguide/ssm-document-not-public.html)

**Parameters:** None

This control checks whether AWS Systems Manager documents that are owned by the account are public\. This control fails if SSM documents with the owner `Self` are public\.

SSM documents that are public might allow unintended access to your documents\. A public SSM document can expose valuable information about your account, resources, and internal processes\.

Unless your use case requires public sharing to be enabled, Security Hub recommends that you turn on the block public sharing setting for your Systems Manager documents that are owned by `Self`\.

**Note**  
This control is not supported in the following Regions:  
China \(Beijing\)
China \(Ningxia\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)
This control is still in the release process\. It might not yet be available in all of the Regions where it is supported\.

### Remediation<a name="ssm-4-remediation"></a>



For more information about disabling public access to SSM documents, see [Modify permissions for a shared SSM document](https://docs.aws.amazon.com/systems-manager/latest/userguide/ssm-share-modify.html) and [Best practices for shared SSM documents](https://docs.aws.amazon.com/systems-manager/latest/userguide/ssm-before-you-share.html) in the *AWS Systems Manager User Guide*\.

