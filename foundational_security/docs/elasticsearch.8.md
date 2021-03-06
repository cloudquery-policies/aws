## \[ES\.8\] Connections to Elasticsearch domains should be encrypted using TLS 1\.2

**Category:** Protect > Data protection > Encryption of data in transit

**Severity:** Medium

**Resource type:** `AWS::Elasticsearch::Domain`

**AWS Config rule:** `elasticsearch-https-required` \(Custom rule developed by Security Hub\)

**Parameters:** None

This control checks whether connections to Elasticsearch domains are required to use TLS 1\.2\. The check fails if the Elasticsearch domain `TLSSecurityPolicy` is not Policy\-Min\-TLS\-1\-2\-2019\-07\.

HTTPS \(TLS\) can be used to help prevent potential attackers from using person\-in\-the\-middle or similar attacks to eavesdrop on or manipulate network traffic\. Only encrypted connections over HTTPS \(TLS\) should be allowed\. Encrypting data in transit can affect performance\. You should test your application with this feature to understand the performance profile and the impact of TLS\. TLS 1\.2 provides several security enhancements over previous versions of TLS\.

### Remediation<a name="es-8-remediation"></a>

To enable TLS encryption, use the [https://docs.aws.amazon.com/opensearch-service/latest/developerguide/configuration-api.html#configuration-api-actions-updatedomainconfig](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/configuration-api.html#configuration-api-actions-updatedomainconfig) API operation to configure the [https://docs.aws.amazon.com/opensearch-service/latest/developerguide/configuration-api.html#configuration-api-datatypes-domainendpointoptions](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/configuration-api.html#configuration-api-datatypes-domainendpointoptions) in order to set the `TLSSecurityPolicy`\. For more information, see the *Amazon OpenSearch Service Developer Guide*\.

