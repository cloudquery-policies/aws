# Elasticsearch domains should be in a VPC

This control checks whether Elasticsearch domains are in a VPC.

It does not evaluate the VPC subnet routing configuration to determine public reachability.

This AWS control also does not check whether the OpenSearch Service resource-based policy permits public access by other accounts or external entities. You should ensure that Elasticsearch domains are not attached to public subnets. See [Resource-based policies](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/ac.html#ac-types-resource) in the _Amazon OpenSearch Service Developer Guide_.

You should also ensure that your VPC is configured according to the recommended best practices. See [Security best practices for your VPC](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-best-practices.html) in the _Amazon VPC User Guide_.

> This control is not supported in Asia Pacific (Osaka).

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements:

**PCI DSS 1.2.1: Restrict inbound and outbound traffic to that which is necessary for the cardholder data environment (CDE), and specifically deny all other traffic.**

> If your OpenSearch Service clusters contain cardholder data, the OpenSearch Service domains should be placed in a VPC. Doing so enables secure communication between OpenSearch Service and other services within the VPC without the need for an internet gateway, NAT device, or VPN connection port.
>
> This method is used to allow only necessary traffic to and from the CDE.

**PCI DSS 1.3.1: Implement a DMZ to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports.**

> If your OpenSearch Service clusters contain cardholder data, the OpenSearch Service domains should be placed in a VPC. Doing so enables secure communication between OpenSearch Service and other services within the VPC without the need for an internet gateway, NAT device, or VPN connection port.
> 
> This method is used to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports.

**PCI DSS 1.3.2: Limit inbound internet traffic to IP addresses within the DMZ.**

> If your OpenSearch Service clusters contain cardholder data, the OpenSearch Service domains should be placed in a VPC, which enables secure communication between OpenSearch Service and other services within the VPC without the need for an internet gateway, NAT device, or VPN connection port.
>
> This method is used to limit inbound internet traffic to IP addresses within the DMZ.
>
> You can also use a resource-based policy and specify an IP condition for restricting access based on source IP addresses. See the blog post [How to control access to your Amazon OpenSearch Service domain](http://aws.amazon.com/blogs/security/how-to-control-access-to-your-amazon-elasticsearch-service-domain/).

**PCI DSS 1.3.4: Do not allow unauthorized outbound traffic from the cardholder data environment to the internet.**

> If your OpenSearch Service clusters contain cardholder data, the OpenSearch Service domains should be placed in a VPC, which enables secure communication between OpenSearch Service and other services within the VPC without the need for an internet gateway, NAT device, or VPN connection port.
>
> This method is used to block unauthorized outbound traffic from the cardholder data environment to the internet.

**PCI DSS 1.3.6: Place system components that store cardholder data (such as a database) in an internal network zone, segregated from the DMZ and other untrusted networks.**

> If your OpenSearch Service clusters contain cardholder data, the OpenSearch Service domains should be placed in a VPC. Doing so enables secure communication between OpenSearch Service and other services within the VPC without the need for an internet gateway, NAT device, or VPN connection port.
>
> This method is used to place system components that store cardholder data in an internal network zone, segregated from the DMZ and other untrusted networks.

## Remediation

If you create a domain with a public endpoint, you cannot later place it within a VPC. Instead, you must create a new domain and migrate your data.

The reverse is also true. If you create a domain within a VPC, it cannot have a public endpoint. Instead, you must either[ create another domain](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html) or disable this control.
