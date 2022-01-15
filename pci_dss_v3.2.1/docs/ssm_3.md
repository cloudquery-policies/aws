# EC2 instances should be managed by AWS Systems Manager

This control checks whether the EC2 instances in your account are managed by Systems Manager.

AWS Systems Manager is an AWS service that you can use to view and control your AWS infrastructure. To help you to maintain security and compliance, Systems Manager scans your managed instances. A managed instance is a machine that is configured for use with Systems Manager. Systems Manager then reports or takes corrective action on any policy violations that it detects. Systems Manager also helps you to configure and maintain your managed instances. Additional configuration is needed in Systems Manager for patch deployment to managed EC2 instances.

To learn more, see the [AWS Systems Manager User Guide](https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html).

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements:

**PCI DSS 2.4 Maintain an inventory of system components that are in scope for PCI DSS.**

> If you use EC2 instances managed by Systems Manager to collect inventory for your cardholder data environment (CDE), make sure that the instances are managed by Systems Manager. Using Systems Manager can help to maintain an inventory of system components that are in scope for PCI DSS. For additional guidance on how to organize inventory, see [Configuring resource data sync for inventory](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-datasync.html) in the AWS Systems Manager User Guide.

**PCI DSS 6.2 Ensure that all system components and software are protected from known vulnerabilities by installing applicable vendor supplied security patches. Install critical security patches within one month of release.**

> For systems that are in scope for PCI DSS, before you install vendor patches in a production environment, you should test and validate them. After you deploy patches, validate security settings and controls to ensure that deployed patches have not affected the security of the CDE. If you use EC2 instances managed by Systems Manager to patch managed instances in your CDE, ensure that the instances are managed by Systems Manager. Systems Manager deploys system patches, which helps to protect system components and software from known vulnerabilities.

## Remediation

You can use the Systems Manager quick setup to set up Systems Manager to manage your EC2 instances.

To determine whether your instances can support Systems Manager associations, see [Systems Manager prerequisites](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-prereqs.html) in the _AWS Systems Manager User Guide_.

**To ensure EC2 instances are managed by Systems Manager**

1. Open the AWS Systems Manager console at https://console.aws.amazon.com/systems-manager/.
2. In the navigation pane, choose **Quick setup**.
3. On the configuration screen, keep the default options.
4. Choose **Set up Systems Manager**.
