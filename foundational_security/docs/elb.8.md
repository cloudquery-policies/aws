## \[ELB\.8\] Classic Load Balancers with HTTPS/SSL listeners should use a predefined security policy that has strong configuration

**Category:** Protect > Encryption of data in transit 

**Severity:** Medium

**Resource type:** `AWS::ElasticLoadBalancing::LoadBalancer`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/elb-predefined-security-policy-ssl-check.html](https://docs.aws.amazon.com/config/latest/developerguide/elb-predefined-security-policy-ssl-check.html)

**Parameters:**
+ `predefinedPolicyName`: `ELBSecurityPolicy-TLS-1-2-2017-01`

This control checks whether your Classic Load Balancer HTTPS/SSL listeners use the predefined policy `ELBSecurityPolicy-TLS-1-2-2017-01`\. The control fails if the Classic Load Balancer HTTPS/SSL listeners do not use `ELBSecurityPolicy-TLS-1-2-2017-01`\.

A security policy is a combination of SSL protocols, ciphers, and the Server Order Preference option\. Predefined policies control the ciphers, protocols, and preference orders to support during SSL negotiations between a client and load balancer\.

Using `ELBSecurityPolicy-TLS-1-2-2017-01` can help you to meet compliance and security standards that require you to disable specific versions of SSL and TLS\. For more information, see [Predefined SSL security policies for Classic Load Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-policy-table.html) in *User Guide for Classic Load Balancers*\.

**Note**  
This control is not supported in the following Regions:  
Africa \(Cape Town\)
Asia Pacific \(Osaka\)
Europe \(Milan\)
AWS GovCloud \(US\-East\)
This control is still in the release process\. It might not yet be available in all of the Regions where it is supported\.

### Remediation<a name="elb-8-remediation"></a>

For information on how to use the predefined security policy `ELBSecurityPolicy-TLS-1-2-2017-01` with a Classic Load Balancer, see [Configure security settings](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-create-https-ssl-load-balancer.html#config-backend-auth) in *User Guide for Classic Load Balancers*\.

