# Amazon SageMaker notebook instances should not have direct internet access

This control checks whether direct internet access is disabled for an SageMaker notebook instance. To do this, it checks whether the `DirectInternetAccess` field is disabled for the notebook instance.

If you configure your SageMaker instance without a VPC, then by default direct internet access is enabled on your instance. You should configure your instance with a VPC and change the default setting to **Disable — Access the internet through a VPC**.

To train or host models from a notebook, you need internet access. To enable internet access, make sure that your VPC has a NAT gateway and your security group allows outbound connections. To learn more about how to connect a notebook instance to resources in a VPC, see [Connect a notebook instance to resources in a VPC](https://docs.aws.amazon.com/sagemaker/latest/dg/appendix-notebook-and-internet-access.html) in the _Amazon SageMaker Developer Guide_.

You should also ensure that access to your SageMaker configuration is limited to only authorized users. Restrict users' IAM permissions to modify SageMaker settings and resources.

> This control is not supported in the following Regions.
>
> * Africa (Cape Town)
> * Asia Pacific (Osaka)
> * China (Beijing)
> * China (Ningxia)
> * Europe (Milan)
> * AWS GovCloud (US-East)

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements:

**PCI DSS 1.2.1 - Restrict inbound and outbound traffic to that which is necessary for the cardholder data environment (CDE), and specifically deny all other traffic.**

> If you use SageMaker notebook instances within your CDE, ensure that the notebook instance does not allow direct internet access. Allowing direct public access to your notebook instance might violate the requirement to allow only necessary traffic to and from the CDE.

**PCI DSS 1.3.1 - Implement a DMZ to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports.**

> If you use SageMaker notebook instances within your CDE, ensure that the notebook instance does not allow direct internet access. Allowing direct public access to your notebook instance might violate the requirement to only allow access to system components that provide authorized publicly accessible services, protocols, and ports.

**PCI DSS 1.3.2 - Limit inbound internet traffic to IP addresses within the DMZ.**

> If you use SageMaker notebook instances within your CDE, ensure that the notebook instance does not allow direct internet access. Allowing direct public access to your notebook instance might violate the requirement to limit inbound traffic to IP addresses within the DMZ.

**PCI DSS 1.3.4 Do not allow unauthorized outbound traffic from the cardholder data environment to the internet.**

> If you use SageMaker notebook instances within your CDE, ensure that the notebook instance does not allow direct internet access. Allowing direct public access to your notebook instance might violate the requirement to block unauthorized outbound traffic from the cardholder data environment to the internet

**PCI DSS 1.3.6 Place system components that store cardholder data (such as a database) in an internal network zone, segregated from the DMZ and other untrusted networks.**

> If you use SageMaker notebook instances, and the notebook instance contains cardholder data, restrict direct internet access. Allowing direct public access to your notebook instance might violate the requirement to place system components that store cardholder data in an internal network zone, segregated from the DMZ and other untrusted networks.

## Remediation

Note that you cannot change the internet access setting after a notebook instance is created. It must be stopped, deleted, and recreated.

**To configure an SageMaker notebook instance to deny direct internet access**

1. Open the SageMaker console at https://console.aws.amazon.com/sagemaker/
2. Navigate to **Notebook instances**.
3. Delete the instance that has direct internet access enabled. Choose the instance, choose **Actions**, then choose stop.

    After the instance is stopped, choose **Actions**, then choose **delete**.
4. Choose **Create notebook instance**. Provide the configuration details.
5. Expand the **Network** section. Then choose a VPC, subnet, and security group. Under **Direct internet access**, choose **Disable — Access the internet through a VPC**.
6. Choose **Create notebook instance**.
