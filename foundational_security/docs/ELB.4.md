## \[ELB\.4\] Application load balancers should be configured to drop HTTP headers<a name="fsbp-elb-4"></a>

**Category:** Protect > Network security

**Severity:** Medium

**Resource type:** `AWS::ElasticLoadBalancing::LoadBalancer`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/alb-http-drop-invalid-header-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/alb-http-drop-invalid-header-enabled.html)

**Parameters:** None

This control evaluates AWS Application Load Balancers to ensure they are configured to drop invalid HTTP headers\. The control fails if the value of `routing.http.drop_invalid_header_fields.enabled` is set to `false`\.

By default, Application Load Balancers are not configured to drop invalid HTTP header values\. Removing these header values prevents HTTP desync attacks\.

**Note**  
This control is not supported in the following Regions:  
Africa \(Cape Town\)
Asia Pacific \(Osaka\)
Europe \(Milan\)

### Remediation<a name="elb-4-remediation"></a>

To remediate this issue, configure your load balancer to drop invalid header fields\.

**To configure the load balancer to drop invalid header fields**

1. Open the Amazon EC2 console at [https://console\.aws\.amazon\.com/ec2/](https://console.aws.amazon.com/ec2/)\.

1. In the navigation pane, choose **Load balancers**\.

1. Choose an Application Load Balancer\.

1. From **Actions**, choose **Edit attributes**\.

1. Under **Drop Invalid Header Fields**, choose **Enable**\.

1. Choose **Save**\.

