## \[ES\.6\] Elasticsearch domains should have at least three data nodes<a name="fsbp-es-6"></a>

**Category:** Recover > Resilience > High availability

**Severity:** Medium

**Resource type:** `AWS::Elasticsearch::Domain`

**AWS Config rule:** `elasticsearch-data-node-fault-tolerance` \(Custom rule developed by Security Hub\)

**Parameters:** None

This control checks whether Elasticsearch domains are configured with at least three data nodes and `zoneAwarenessEnabled` is `true`\.

An Elasticsearch domain requires at least three data nodes for high availability and fault\-tolerance\. Deploying an Elasticsearch domain with at least three data nodes ensures cluster operations if a node fails\.

### Remediation<a name="es-6-remediation"></a>

**To modify the number of data nodes in an Elasticsearch domain**

1. Open the Amazon OpenSearch Service console at [https://console\.aws\.amazon\.com/es/](https://console.aws.amazon.com/es/)\.

1. Under **My domains**, choose the name of the domain to edit\.

1. Choose **Edit domain**\.

1. Under **Data nodes**, set **Number of nodes** to a number greater than or equal to three\.

   For three Availability Zone deployments, set to a multiple of three to ensure equal distribution across Availability Zones\.

1. Choose **Submit**\.

