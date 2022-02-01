## \[ELB\.2\] Classic Load Balancers with SSL/HTTPS listeners should use a certificate provided by AWS Certificate Manager

**Category:** Protect > Encryption of data in transit

**Severity:** Medium

**Resource type:** `AWS::ElasticLoadBalancing::LoadBalancer`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/elb-acm-certificate-required.html](https://docs.aws.amazon.com/config/latest/developerguide/elb-acm-certificate-required.html)

**Parameters:** None

This control checks whether the Classic Load Balancer uses HTTPS/SSL certificates provided by AWS Certificate Manager \(ACM\)\. The control fails if the Classic Load Balancer configured with HTTPS/SSL listener does not use a certificate provided by ACM\.

To create a certificate, you can use either ACM or a tool that supports the SSL and TLS protocols, such as OpenSSL\. Security Hub recommends that you use ACM to create or import certificates for your load balancer\.

ACM integrates with Classic Load Balancers so that you can deploy the certificate on your load balancer\. You also should automatically renew these certificates\.

**Note**  
These controls are not supported in the following Regions:  
Africa \(Cape Town\)
Asia Pacific \(Osaka\)
China \(Beijing\)
China \(Ningxia\)
Europe \(Milan\)
AWS GovCloud \(US\-East\)
This control is still in the release process\. It might not yet be available in all of the Regions where it is supported\.

### Remediation<a name="elb-2-remediation"></a>

For information on how to associate an ACM SSL/TLS certificate with a Classic Load Balancer, see the Knowledge Center article [How can I associate an ACM SSL/TLS certificate with a Classic, Application, or Network Load Balancer?](http://aws.amazon.com/premiumsupport/knowledge-center/associate-acm-certificate-alb-nlb/)

