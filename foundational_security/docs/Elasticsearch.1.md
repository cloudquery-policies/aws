## \[ES\.1\] Elasticsearch domains should have encryption at rest enabled<a name="fsbp-es-1"></a>

**Category:** Protect > Data protection > Encryption of data at rest

**Severity:** Medium

**Resource type:** `AWS::Elasticsearch::Domain`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/elasticsearch-encrypted-at-rest.html](https://docs.aws.amazon.com/config/latest/developerguide/elasticsearch-encrypted-at-rest.html)

**Parameters:** None

This control checks whether Elasticsearch domains have encryption at rest configuration enabled\. The check fails if encryption at rest is not enabled\.

For an added layer of security for your sensitive data in OpenSearch, you should configure your OpenSearch to be encrypted at rest\. Elasticsearch domains offer encryption of data at rest\. The feature uses AWS KMS to store and manage your encryption keys\. To perform the encryption, it uses the Advanced Encryption Standard algorithm with 256\-bit keys \(AES\-256\)\.

To learn more about OpenSearch encryption at rest, see [Encryption of data at rest for Amazon OpenSearch Service](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/encryption-at-rest.html) in the *Amazon OpenSearch Service Developer Guide*\.

**Note**  
Certain instance types, such as `t.small` and `t.medium`, do not support encryption of data at rest\. For details, see [Supported instance types](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/supported-instance-types.html) in the *Amazon OpenSearch Service Developer Guide*\.

### Remediation<a name="es-1-remediation"></a>

By default, domains do not encrypt data at rest, and you cannot configure existing domains to use the feature\.

To enable the feature, you must create another domain and migrate your data\. For information about creating domains, see the [https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html)\.

Encryption of data at rest requires OpenSearch Service 5\.1 or later\. For more information about encrypting data at rest for OpenSearch Service, see the [https://docs.aws.amazon.com/opensearch-service/latest/developerguide/encryption-at-rest.html](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/encryption-at-rest.html)\.

