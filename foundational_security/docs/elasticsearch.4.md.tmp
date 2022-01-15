## \[ES\.4\] Elasticsearch domain error logging to CloudWatch Logs should be enabled<a name="fsbp-es-4"></a>

**Category:** Identify \- Logging

**Severity:** Medium

**Resource type:** `AWS::Elasticsearch::Domain`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/elasticsearch-logs-to-cloudwatch.html](https://docs.aws.amazon.com/config/latest/developerguide/elasticsearch-logs-to-cloudwatch.html)

**Parameters:**
+ `logtype = 'error'`

This control checks whether Elasticsearch domains are configured to send error logs to CloudWatch Logs\.

You should enable error logs for Elasticsearch domains and send those logs to CloudWatch Logs for retention and response\. Domain error logs can assist with security and access audits, and can help to diagnose availability issues\.

**Note**  
This control is not supported in the following Regions:  
China \(Beijing\)
China \(Ningxia\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="es-4-remediation"></a>

For information on how to enable log publishing, see [Enabling log publishing \(console\)](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createdomain-configure-slow-logs.html#createdomain-configure-slow-logs-console) in the *Amazon OpenSearch Service Developer Guide*\.

