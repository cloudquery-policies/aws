# A log metric filter and alarm should exist for usage of the "root" user

This control checks for the CloudWatch metric filters using the following pattern:

    { $.userIdentity.type = "Root" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != "AwsServiceEvent" }

It checks the following:

* The log group name is configured for use with active multi-Region CloudTrail.
* There is at least one Event Selector for a Trail with IncludeManagementEvents set to true and ReadWriteType set to All.
* There is at least one active subscriber to an Amazon SNS topic associated with the alarm.

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements:

**PCI DSS 7.2.1: Establish an access control system(s) for systems components that restricts access based on a user’s need to know, and is set to "deny all" unless specifically allowed. This access control system(s) must include the following: Coverage of all system components.**

> The root user is the most privileged user in an AWS account and has unrestricted access to all resources in the AWS account.
>
> You should set up log metric filters and alarms in the event that AWS account root user credentials are used.
>
> You should also ensure that CloudTrail is enabled to keep an audit trail of actions taken by any individual with root or administrative privileges. Root user identification would be found in the `userIdentity` section of the CloudTrail log.

## Remediation

The steps to remediate this issue include setting up an Amazon SNS topic, a metric filter, and an alarm for the metric filter.

These are the same steps to remediate findings for 3.3 – Ensure a log metric filter and alarm exist for usage of "root" account .

**To create an Amazon SNS topic**

1. Open the Amazon SNS console at https://console.aws.amazon.com/sns/v3/home.
2. Create an Amazon SNS topic that receives all CIS alarms.

    Create at least one subscriber to the topic.

    For more information about creating Amazon SNS topics, see the [Amazon Simple Notification Service Developer Guide](https://docs.aws.amazon.com/sns/latest/dg/sns-getting-started.html#CreateTopic).

3. Set up an active CloudTrail trail that applies to all Regions.

    To do this, follow the remediation steps in 2.1 – Ensure CloudTrail is enabled in all Regions.

    Make a note of the associated log group name.

**To create a metric filter and alarm**

1. Open the CloudWatch console at https://console.aws.amazon.com/cloudwatch/.
2. Choose **Logs**, then choose **Log groups**.
3. Choose the log group where CloudTrail is logging.
4. On the log group details page, choose **Metric filters**.
5. Choose **Create metric filter**.
6. Copy the following pattern and then paste it into Filter pattern.

    `{$.userIdentity.type="Root" && $.userIdentity.invokedBy NOT EXISTS && $.eventType !="AwsServiceEvent"}`

7. Choose **Next**.
8. Enter the name of the new filter. For example, _RootAccountUsage_.
9. Confirm that the value for **Metric namespace** is _LogMetrics_.

    This ensures that all CIS Benchmark metrics are grouped together.

10. In **Metric name**, enter the name of the metric.
11. In **Metric value**, enter _1_, and then choose **Next**.
12. Choose **Create metric filter**.
13. Next, set up the notification. Select the metric filter you just created, then choose **Create alarm**.
14. Enter the threshold for the alarm (for example, _1_), then choose **Next**.
15. Under **Select an SNS topic**, for **Send notification to**, choose an email list, then choose **Next**.
16. Enter a **Name** and **Description** for the alarm, such as _RootAccountUsageAlarm_, then choose **Next**.
17. Choose **Create Alarm**.
