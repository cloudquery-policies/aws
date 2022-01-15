## \[ECS\.2\] Amazon ECS services should not have public IP addresses assigned to them automatically<a name="fsbp-ecs-2"></a>

**Category:** Protect > Secure network configuration > Resources not publicly accessible

**Severity:** High

**Resource type:** `AWS::ECS::Service`

**AWS Configrule:** `ecs-service-assign-public-ip-disabled` \(Custom rule developed by Security Hub\)

**Parameters:**
+ `exemptEcsServiceArns` \(Optional\)\. Security Hub does not populate this parameter\. Comma\-separated list of ARNs of Amazon ECS services that are exempt from this rule\.

  This rule is `COMPLIANT` if an Amazon ECS service has `AssignPublicIP` set to `ENABLED` and is specified in this parameter list\.

  This rule is `NON_COMPLIANT` if an Amazon ECS service has `AssignPublicIP` set to `ENABLED` and is not specified in this parameter list\.

This control checks whether Amazon ECS services are configured to automatically assign public IP addresses\. This control fails if `AssignPublicIP` is `ENABLED`\. This control passes if `AssignPublicIP` is `DISABLED`\.

A public IP address is an IP address that is reachable from the internet\. If you launch your Amazon ECS instances with a public IP address, then your Amazon ECS instances are reachable from the internet\. Amazon ECS services should not be publicly accessible, as this may allow unintended access to your container application servers\.

**Note**  
This control is not supported in the Asia Pacific \(Osaka\) Region\.

### Remediation<a name="ecs-2-remediation"></a>

To disable automatic public IP assignment, see [To configure VPC and security group settings for your service](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-configure-network.html) in the *Amazon Elastic Container Service Developer Guide*\.

