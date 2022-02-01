## \[DynamoDB\.1\] DynamoDB tables should automatically scale capacity with demand

**Category:** Recover > Resilience > High availability

**Severity:** Medium

**Resource type:** `AWS::DynamoDB::Table`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/dynamodb-autoscaling-enabled.html](https://docs.aws.amazon.com/config/latest/developerguide/dynamodb-autoscaling-enabled.html)

**Parameters:** None

This control checks whether an Amazon DynamoDB table can scale its read and write capacity as needed\. This control passes if the table uses either on\-demand capacity mode or provisioned mode with auto scaling configured\. Scaling capacity with demand avoids throttling exceptions, which helps to maintain availability of your applications\.

DynamoDB tables in on\-demand capacity mode are only limited by the DynamoDB throughput default table quotas\. To raise these quotas, you can file a support ticket through [AWS Support](http://aws.amazon.com/support)\.

DynamoDB tables in provisioned mode with auto scaling adjust the provisioned throughput capacity dynamically in response to traffic patterns\. For additional information on DynamoDB request throttling, see [Request throttling and burst capacity](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughput.html#ProvisionedThroughput.Throttling) in the *Amazon DynamoDB Developer Guide*\.

**Note**  
This control is not supported in AWS GovCloud \(US\-East\) or AWS GovCloud \(US\-West\)\.

### Remediation<a name="dynamodb-1-remediation"></a>

For detailed instructions on enabling DynamoDB automatic scaling on existing tables in capacity mode, see [Enabling DynamoDB auto scaling on existing tables](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/AutoScaling.Console.html#AutoScaling.Console.ExistingTable) in the*Amazon DynamoDB Developer Guide*\.

