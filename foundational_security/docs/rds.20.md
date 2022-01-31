## \[RDS\.20\] An RDS event notifications subscription should be configured for critical database instance events

**Category:** Detect > Detection services > Application monitoring

**Severity:** Low

**Resource type:** `AWS::RDS::EventSubscription`

**AWS Config rule:** `rds-instance-event-notifications-configured` \(Custom rule developed by Security Hub\)

**Parameters:** None

This control checks whether an Amazon RDS event subscription exists with notifications enabled for the following source type, event category key\-value pairs\.

```
DBInstance: ["maintenance","configuration change","failure"]
```

RDS event notifications use Amazon SNS to make you aware of changes in the availability or configuration of your RDS resources\. These notifications allow for rapid response\. For additional information about RDS event notifications, see [Using Amazon RDS event notification](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html) in the *Amazon RDS User Guide*\.

### Remediation<a name="rds-20-remediation"></a>

**To subscribe to RDS instance event notifications**

1. Open the Amazon RDS console at [https://console\.aws\.amazon\.com/rds/](https://console.aws.amazon.com/rds/)\.

1. In the navigation pane, choose **Event subscriptions**\. 

1. Under **Event subscriptions**, choose **Create event subscription**\.

1. In the **Create event subscription** dialog, do the following: 

   1. For **Name**, enter a name for the event notification subscription\. 

   1. For **Send notifications to**, choose an existing Amazon SNS ARN for an SNS topic\. To use a new topic, choose **create topic** to enter the name of a topic and a list of recipients\. 

   1. For **Source type**, choose **Instances**\.

   1. Under **Instances to include**, select **All instances**\.

   1. Under **Event categories to include**, select **Specific event categories**\. The control also passes if you select **All event categories**\.

   1. Select **maintenance**, **configuration change**, and **failure**\.

   1. Choose **Create**\.

