## \[ES\.5\] Elasticsearch domains should have audit logging enabled<a name="fsbp-es-5"></a>

**Category:** Identify > Logging

**Severity:** Medium

**Resource type:** `AWS::Elasticsearch::Domain`

**AWS Config rule:** `elasticsearch-audit-logging-enabled` \(Custom rule developed by Security Hub\)

**Parameters:**
+ `cloudWatchLogsLogGroupArnList` \(Optional\)\. Security Hub does not populate this parameter\. Comma\-separated list of CloudWatch Logs log groups that should be configured for audit logs\.

  This rule is `NON_COMPLIANT` if the CloudWatch Logs log group of the Elasticsearch domain is not specified in this parameter list\.

This control checks whether Elasticsearch domains have audit logging enabled\. This control fails if an Elasticsearch domain does not have audit logging enabled\. 

Audit logs are highly customizable\. They allow you to track user activity on your Elasticsearch clusters, including authentication successes and failures, requests to OpenSearch, index changes, and incoming search queries\.

### Remediation<a name="es-5-remediation"></a>

For detailed instructions on enabling audit logs, see [Enabling audit logs](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/audit-logs.html#audit-log-enabling) in the *Amazon OpenSearch Service Developer Guide*\.

