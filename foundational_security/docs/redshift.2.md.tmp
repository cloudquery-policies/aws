## \[Redshift\.2\] Connections to Amazon Redshift clusters should be encrypted in transit<a name="fsbp-redshift-2"></a>

**Category:** Protect > Data protection > Encryption of data in transit 

**Severity:** Medium

**Resource type:** `AWS::Redshift::Cluster`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/redshift-require-tls-ssl.html](https://docs.aws.amazon.com/config/latest/developerguide/redshift-require-tls-ssl.html)

**Parameters:** None

This control checks whether connections to Amazon Redshift clusters are required to use encryption in transit\. The check fails if the Amazon Redshift cluster parameter `require_SSL` is not set to 1\.

TLS can be used to help prevent potential attackers from using person\-in\-the\-middle or similar attacks to eavesdrop on or manipulate network traffic\. Only encrypted connections over TLS should be allowed\. Encrypting data in transit can affect performance\. You should test your application with this feature to understand the performance profile and the impact of TLS\. 

**Note**  
This control is not supported in Europe \(Milan\)\.

### Remediation<a name="redshift-2-remediation"></a>

To remediate this issue, update the parameter group to require encryption\.

**To modify a parameter group**

1. Open the Amazon Redshift console at [https://console\.aws\.amazon\.com/redshift/](https://console.aws.amazon.com/redshift/)\.

1. In the navigation menu, choose **Config**, then choose **Workload management** to display the **Workload management** page\. 

1. Choose the parameter group that you want to modify\. 

1. Choose **Parameters**\.

1. Choose **Edit parameters** then set `require_ssl` to 1\.

1. Enter your changes and then choose **Save**\.

