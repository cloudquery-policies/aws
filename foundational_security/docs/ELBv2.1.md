## \[ELBv2\.1\] Application Load Balancer should be configured to redirect all HTTP requests to HTTPS<a name="fsbp-elbv2-1"></a>

**Category:** Protect > Data protection > Encryption of data in transit

**Severity:** Medium

**Resource type:** `AWS::ElasticLoadBalancingV2::LoadBalancer`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/alb-http-to-https-redirection-check.html](https://docs.aws.amazon.com/config/latest/developerguide/alb-http-to-https-redirection-check.html)

**Parameters:** None

This control checks whether HTTP to HTTPS redirection is configured on all HTTP listeners of Application Load Balancers\. The check fails if one or more HTTP listeners of Application Load Balancers do not have HTTP to HTTPS redirection configured\.

Before you start to use your Application Load Balancer, you must add one or more listeners\. A listener is a process that uses the configured protocol and port to check for connection requests\. Listeners support both HTTP and HTTPS protocols\. You can use an HTTPS listener to offload the work of encryption and decryption to your Application Load Balancer\. You should use redirect actions with Application Load Balancer to redirect client HTTP request to an HTTPS request on port 443 to enforce encryption in\-transit\.

To learn more, see [Listeners for your Application Load Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html) in *User Guide for Application Load Balancers*\.

**Note**  
This control is not supported in Africa \(Cape Town\) or Europe \(Milan\)\.

### Remediation<a name="elbv2-1-remediation"></a>

To remediate this issue, update your load balancers to redirect HTTP requests\.

**To redirect HTTP requests to HTTPS on an Application Load Balancer**

1. Open the Amazon EC2 console at [https://console\.aws\.amazon\.com/ec2/](https://console.aws.amazon.com/ec2/)\.

1. In the navigation pane, choose **Load balancers**\.

1. Choose an Application Load Balancer\.

1. Choose the **Listeners** tab\.

1. Choose an HTTP listener \(port 80 TCP\) and then choose **Edit**\.

1. If there is an existing rule, you must delete it\. Otherwise, choose **Add action** and then choose **Redirect to\.\.\.**

1. Choose **HTTPS** and then enter **443**\.

1. Choose the check mark in a circle symbol and then choose **Update**\.

