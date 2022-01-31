## \[ELB\.5\] Application and Classic Load Balancers logging should be enabled

**Category:** Logging

**Severity:** Medium

**Resource type:** `AWS::ElasticLoadBalancing::LoadBalancer`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/elb-logging-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/elb-logging-enabled.html)

**Parameters:** None

This control checks whether the Application Load Balancer and the Classic Load Balancer have logging enabled\. The control fails if `access_logs.s3.enabled` is `false`\.

Elastic Load Balancing provides access logs that capture detailed information about requests sent to your load balancer\. Each log contains information such as the time the request was received, the client's IP address, latencies, request paths, and server responses\. You can use these access logs to analyze traffic patterns and to troubleshoot issues\. 

To learn more, see [Access logs for your Classic Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/access-log-collection.html) in *User Guide for Classic Load Balancers*\.

### Remediation<a name="elb-5-remediation"></a>

To remediate this issue, update your load balancers to enable logging\.

**To enable access logs**

1. Open the Amazon EC2 console at [https://console\.aws\.amazon\.com/ec2/](https://console.aws.amazon.com/ec2/)\.

1. In the navigation pane, choose **Load balancers**\. 

1. Choose an Application Load Balancer\.

1. From **Actions**, choose **Edit attributes**\.

1. Under **Access logs**, choose **Enable**\.

1. Enter your S3 location\. This location can exist or it can be created for you\. If you do not specify a prefix, the access logs are stored in the root of the S3 bucket\.

1. Choose **Save**\.

