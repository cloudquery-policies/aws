## \[AutoScaling\.1\] Auto Scaling groups associated with a load balancer should use load balancer health checks<a name="fsbp-autoscaling-1"></a>

**Category:** Identify > Inventory

**Severity:** Low

**Resource type:** `AWS::AutoScaling::AutoScalingGroup`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/autoscaling-group-elb-healthcheck-required.html](https://docs.aws.amazon.com/config/latest/developerguide/autoscaling-group-elb-healthcheck-required.html)

**Parameters:** None

This control checks whether your Auto Scaling groups that are associated with a load balancer are using Elastic Load Balancing health checks\.

This ensures that the group can determine an instance's health based on additional tests provided by the load balancer\. Using Elastic Load Balancing health checks can help support the availability of applications that use EC2 Auto Scaling groups\. 

### Remediation<a name="autoscaling-1-remediation"></a>

To remediate this issue, update your Auto Scaling groups to use Elastic Load Balancing health checks\.

**To enable Elastic Load Balancing health checks**

1. Open the Amazon EC2 console at [https://console\.aws\.amazon\.com/ec2/](https://console.aws.amazon.com/ec2/)\.

1. In the navigation pane, under **Auto Scaling**, choose **Auto Scaling Groups**\.

1. Select the check box for your group\.

1. Choose **Edit**\.

1. Under **Health checks**, for **Health check type**, choose **ELB**\.

1. For **Health check grace period**, enter **300**\.

1. At the bottom of the page, choose **Update**\.

For more information on using a load balancer with an Auto Scaling group, see the [https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html)\.

