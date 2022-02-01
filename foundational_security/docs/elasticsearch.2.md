## \[ES\.2\] Elasticsearch domains should be in a VPC

**Category:** Protect > Secure network configuration > Resources within VPC 

**Severity:** Critical

**Resource type:** `AWS::Elasticsearch::Domain`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/elasticsearch-in-vpc-only.html](https://docs.aws.amazon.com/config/latest/developerguide/elasticsearch-in-vpc-only.html)

**Parameters:** None

This control checks whether Elasticsearch domains are in a VPC\. It does not evaluate the VPC subnet routing configuration to determine public access\. You should ensure that Elasticsearch domains are not attached to public subnets\. See [Resource\-based policies](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/ac.html#ac-types-resource) in the *Amazon OpenSearch Service Developer Guide*\. You should also ensure that your VPC is configured according to the recommended best practices\. See [Security best practices for your VPC](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-best-practices.html) in the *Amazon VPC User Guide*\.

Elasticsearch domains deployed within a VPC can communicate with VPC resources over the private AWS network, without the need to traverse the public internet\. This configuration increases the security posture by limiting access to the data in transit\. VPCs provide a number of network controls to secure access to Elasticsearch domains, including network ACL and security groups\. Security Hub recommends that you migrate public Elasticsearch domains to VPCs to take advantage of these controls\.

### Remediation<a name="es-2-remediation"></a>

If you create a domain with a public endpoint, you cannot later place it within a VPC\. Instead, you must create a new domain and migrate your data\. The reverse is also true\. If you create a domain within a VPC, it cannot have a public endpoint\. Instead, you must either [create another domain](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html) or disable this control\.

See [Launching your Amazon OpenSearch Service domains within a VPC](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/vpc.html) in the *Amazon OpenSearch Service Developer Guide*\.

