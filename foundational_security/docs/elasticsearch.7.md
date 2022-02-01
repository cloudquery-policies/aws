## \[ES\.7\] Elasticsearch domains should be configured with at least three dedicated master nodes

**Category:** Recover > Resilience > High availability

**Severity:** Medium

**Resource type:** `AWS::Elasticsearch::Domain`

**AWS Configrule:** `elasticsearch-primary-node-fault-tolerance` \(Custom rule developed by Security Hub\)

**Parameters:** None

This control checks whether Elasticsearch domains are configured with at least three dedicated master nodes\. This control fails if the domain does not use dedicated master nodes\. This control passes if Elasticsearch domains have five dedicated master nodes\. However, using more than three master nodes might be unnecessary to mitigate the availability risk, and will result in additional cost\.

An Elasticsearch domain requires at least three dedicated master nodes for high availability and fault\-tolerance\. Dedicated master node resources can be strained during data node blue/green deployments because there are additional nodes to manage\. Deploying an Elasticsearch domain with at least three dedicated master nodes ensures sufficient master node resource capacity and cluster operations if a node fails\.

### Remediation<a name="es-7-remediation"></a>

**To modify the number of dedicated master nodes in an OpenSearch domain**

1. Open the Amazon OpenSearch Service console at [https://console\.aws\.amazon\.com/es/](https://console.aws.amazon.com/es/)\.

1. Under **My domains**, choose the name of the domain to edit\.

1. Choose **Edit domain**\.

1. Under **Dedicated master nodes**, set **Instance type** to the desired instance type\.

1. Set **Number of master nodes** equal to three or greater\.

1. Choose **Submit**\.

