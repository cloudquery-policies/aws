## \[ELB\.3\] Classic Load Balancer listeners should be configured with HTTPS or TLS termination

**Category:** Protect > Data protection > Encryption of data in transit 

**Severity:** Medium

**Resource type:** `AWS::ElasticLoadBalancing::LoadBalancer`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/elb-tls-https-listeners-only.html](https://docs.aws.amazon.com/config/latest/developerguide/elb-tls-https-listeners-only.html)

**Parameters:** None

This control checks whether your Classic Load Balancer listeners are configured with HTTPS or TLS protocol for front\-end \(client to load balancer\) connections\. The control is applicable if a Classic Load Balancer has listeners\. If your Classic Load Balancer does not have a listener configured, then the control does not report any findings\.

The control passes if the Classic Load Balancer listeners are configured with TLS or HTTPS for front\-end connections\.

The control fails if the listener is not configured with TLS or HTTPS for front\-end connections\.

Before you start to use a load balancer, you must add one or more listeners\. A listener is a process that uses the configured protocol and port to check for connection requests\. Listeners can support both HTTP and HTTPS/TLS protocols\. You should always use an HTTPS or TLS listener, so that the load balancer does the work of encryption and decryption in transit\.

### Remediation<a name="elb-3-remediation"></a>

To remediate this issue, update your listeners to use the TLS or HTTPS protocol\.

**To change all noncompliant listeners to TLS/HTTPS listeners**

1. Open the Amazon EC2 console at [https://console\.aws\.amazon\.com/ec2/](https://console.aws.amazon.com/ec2/)\.

1. In the navigation pane, choose **Load Balancers**\. Then choose your Classic Load Balancer\.

1. Choose the **Listeners** tab, and then choose **Edit**\.

1. For all listeners where **Load Balancer Protocol** is not set to HTTPS or SSL, change the setting to HTTPS or SSL\.

1. For all modified listeners, under **SSL Certificate**, choose **Change**\.

1. For all modified listeners, select **Choose a certificate from ACM**\.

1. Select the certificate from the **Certificates** drop\-down list\. Then choose **Save**\.

1. After you update all of the listeners, choose **Save**\.

