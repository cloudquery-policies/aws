## \[SageMaker\.1\] SageMaker notebook instances should not have direct internet access

**Category:** Protect > Secure network configuration

**Severity:** High

**Resource type:** `AWS::SageMaker::NotebookInstance`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/sagemaker-notebook-no-direct-internet-access.html](https://docs.aws.amazon.com/config/latest/developerguide/sagemaker-notebook-no-direct-internet-access.html)

**Parameters:** None

This control checks whether direct internet access is disabled for an SageMaker notebook instance\. To do this, it checks whether the `DirectInternetAccess` field is disabled for the notebook instance\. 

If you configure your SageMaker instance without a VPC, then by default direct internet access is enabled on your instance\. You should configure your instance with a VPC and change the default setting to **Disable — Access the internet through a VPC**\.

To train or host models from a notebook, you need internet access\. To enable internet access, make sure that your VPC has a NAT gateway and your security group allows outbound connections\. To learn more about how to connect a notebook instance to resources in a VPC, see [Connect a notebook instance to resources in a VPC](https://docs.aws.amazon.com/sagemaker/latest/dg/appendix-notebook-and-internet-access.html) in the *Amazon SageMaker Developer Guide*\.

You should also ensure that access to your SageMaker configuration is limited to only authorized users\. Restrict users' IAM permissions to modify SageMaker settings and resources\.

**Note**  
This control is not supported in the following Regions\.  
Africa \(Cape Town\)
China \(Beijing\)
China \(Ningxia\)
Europe \(Milan\)
 AWS GovCloud \(US\-East\)

### Remediation<a name="sagemaker-1-remediation"></a>

Note that you cannot change the internet access setting after a notebook instance is created\. It must be stopped, deleted, and recreated\.

**To configure an SageMaker notebook instance to deny direct internet access**

1. Open the SageMaker console at [https://console.aws.amazon.com/sagemaker/](https://console.aws.amazon.com/sagemaker/)

1. Navigate to **Notebook instances**\.

1. Delete the instance that has direct internet access enabled\. Choose the instance, choose **Actions**, then choose stop\.

   After the instance is stopped, choose **Actions**, then choose **delete**\.

1. Choose **Create notebook instance**\. Provide the configuration details\.

1. Expand the network section, then choose a VPC, subnet, and security group\. Under **Direct internet access**, choose **Disable — Access the internet through a VPC**\.

1. Choose **Create notebook instance**\.

For more information, see [Connect a notebook instance to resources in a VPC](https://docs.aws.amazon.com/sagemaker/latest/dg/appendix-notebook-and-internet-access.html) in the *Amazon SageMaker Developer Guide*\.

