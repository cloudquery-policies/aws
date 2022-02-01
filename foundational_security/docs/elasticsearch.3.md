## \[ES\.3\] Elasticsearch domains should encrypt data sent between nodes

**Category:** Protect > Data protection > Encryption of data in transit 

**Severity:** Medium

**Resource type:** `AWS::Elasticsearch::Domain`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/elasticsearch-node-to-node-encryption-check.html](https://docs.aws.amazon.com/config/latest/developerguide/elasticsearch-node-to-node-encryption-check.html)

**Parameters:** None

This control checks whether Elasticsearch domains have node\-to\-node encryption enabled\.

HTTPS \(TLS\) can be used to help prevent potential attackers from eavesdropping on or manipulating network traffic using person\-in\-the\-middle or similar attacks\. Only encrypted connections over HTTPS \(TLS\) should be allowed\. Enabling node\-to\-node encryption for Elasticsearch domains ensures that intra\-cluster communications are encrypted in transit\.

There can be a performance penalty associated with this configuration\. You should be aware of and test the performance trade\-off before enabling this option\. 

**Note**  
This control is not supported in the following Regions:  
Africa \(Cape Town\)
China \(Beijing\)
China \(Ningxia\)
Europe \(Milan\)

### Remediation<a name="es-3-remediation"></a>

Node\-to\-node encryption can only be enabled on a new domain\. To remediate this finding, first [create a new domain](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html) with the **Node\-to\-node encryption** check box selected\. Then follow [Using a snapshot to migrate data](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/version-migration.html#snapshot-based-migration) to migrate your data to the new domain\.

