## \[ELB\.6\] Application Load Balancer deletion protection should be enabled<a name="fsbp-elb-6"></a>

**Category:** Recover > Resilience > High availability

**Severity:** Medium

**Resource type:** `AWS::ElasticLoadBalancingV2::LoadBalancer`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/elb-deletion-protection-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/elb-deletion-protection-enabled.html)

**Parameters:** None

This control checks whether an Application Load Balancer has deletion protection enabled\. The control fails if deletion protection is not configured\.

Enable deletion protection to protect your Application Load Balancer from deletion\. 

### Remediation<a name="elb-6-remediation"></a>

To prevent your load balancer from being deleted accidentally, you can enable deletion protection\. By default, deletion protection is disabled for your load balancer\.

If you enable deletion protection for your load balancer, you must disable delete protection before you can delete the load balancer\.

To enable deletion protection from the console

1. Open the Amazon EC2 console at [https://console\.aws\.amazon\.com/ec2/](https://console.aws.amazon.com/ec2/)\.

1. On the navigation pane, under **LOAD BALANCING**, choose **Load Balancers**\.

1. Choose the load balancer\.

1. On the **Description** tab, choose **Edit attributes**\.

1. On the **Edit load balancer attributes** page, select **Enable for Delete Protection**, and then choose **Save**\.

1. Choose **Save**\.

To learn more, see [Deletion protection](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html#deletion-protection) in *User Guide for Application Load Balancers*\.

