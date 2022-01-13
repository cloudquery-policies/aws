# CloudTrail should be enabled

This control checks whether CloudTrail is enabled in your AWS account.

However, some AWS services do not enable logging of all APIs and events. You should implement any additional audit trails other than CloudTrail and review the documentation for each service in CloudTrail Supported Services and Integrations.

## Related PCI DSS requirements

This control is associated with the following PCI DSS requirements:

**PCI DSS 10.1: Implement audit trails to link all access to system components to each individual user.**

> By enabling CloudTrail, Event History provides you with 90 days of readily available events and audit trails for access to system components by each individual user.
>
> You can find the identity of the users in the `eventSource` section of the CloudTrail log.

**PCI DSS 10.2.1: Implement automated audit trails for all system components to reconstruct the following events: All individual user accesses to cardholder data**

> Depending on where cardholder data is stored, individual user accesses to cardholder data could be found in the `userIdentity`, `eventSource`, `eventName`, or `responseElements` sections of the CloudTrail log.

**PCI DSS 10.2.2: Implement automated audit trails for all system components to reconstruct the following events: All actions taken by any individual with root or administrative privileges**

> Root user identification is found in the `userIdentity` section of the log.

**PCI DSS 10.2.3: Implement automated audit trails for all system components to reconstruct the following events: Access to all audit trails**

> Access to audit trails might be found in the `eventSource`, `eventName`, or `responseElements` sections of the log.

**PCI DSS 10.2.4: Implement automated audit trails for all system components to reconstruct the following events: Invalid logical access attempts**

> You can find invalid logical access attempts in CloudTrail logs. For example: `responseElements : "ConsoleLogin"` and `responseElements : "Failure"`.

**PCI DSS 10.2.5: Implement automated audit trails for all system components to reconstruct the following events: Use of and changes to identification and authentication mechanisms—including but not limited to creation of new accounts and elevation of privileges—and all changes, additions, or deletions to accounts with root or administrative privileges**

> Use of and changes to identification and authentication mechanisms might be found in the `userAgent`, `eventName`, or `responseElements` sections of the log.

**PCI DSS 10.2.6: Implement automated audit trails for all system components to reconstruct the following events: Initialization, stopping, or pausing of the audit logs**

> Starting and stopping logging is captured in the CloudTrail logs.
>
> An example of audit log starting and stopping would look as follows within a CloudTrail Log: `eventName : "StopLogging"` and `eventName : "StartLogging"`

**PCI DSS 10.2.7: Implement automated audit trails for all system components to reconstruct the following events: Creation and deletion of system-level objects**

> Creation and deletion of system level-objects are captured in the CloudTrail logs. An example of a system-level object would be an AWS Lambda function.
>
> CloudTrail captures the createFunction and deleteFunction API calls, as described in the [AWS Lambda Developer Guide](https://docs.aws.amazon.com/lambda/latest/dg/logging-using-cloudtrail.html).

**PCI DSS 10.3.1: Record at least the following audit trail entries for all system components for each event: User identification**

> You can find user identification in the `userIdentity` section of the CloudTrail logs.

**PCI DSS 10.3.2: Record at least the following audit trail entries for all system components for each event: Type of event**

> You can find the type of event in the `eventName` section of the CloudTrail log.

**PCI DSS 10.3.3: Record at least the following audit trail entries for all system components for each event: Date and time**

> You can find the date and time of an event in the `eventTime` section of the CloudTrail log.

**PCI DSS 10.3.4: Record at least the following audit trail entries for all system components for each event: Success or failure indication**

> You can find the success or failure indication in the `responseElements` section of the CloudTrail log.

**PCI DSS 10.3.5: Record at least the following audit trail entries for all system components for each event: Origination of event**

> You can find the origination of an event in the `userAgent` or `sourceIPAddress` section of the CloudTrail log.

**PCI DSS 10.3.6: Record at least the following audit trail entries for all system components for each event: Identity or name of affected data, system component, or resource.**

> You can find the identity of the resource in the `eventSource` section of the CloudTrail log.

## Remediation

**To create a new trail in CloudTrail**

1. Sign in to the AWS Management Console using the IAM user you configured for CloudTrail administration.
2. Open the CloudTrail console at https://console.aws.amazon.com/cloudtrail/.
3. In the **Region** selector, choose the AWS Region where you want your trail to be created. This is the Home Region for the trail.

    The Home Region is the only AWS Region where you can view and update the trail after it is created, even if the trail logs events in all AWS Regions.

4. In the navigation pane, choose **Trails**.

5. On the **Trails** page, choose **Get Started Now**. If you do not see that option, choose **Create Trail**.

6. In **Trail name**, give your trail a name, such as _My-Management-Events-Trail_.

    As a best practice, use a name that quickly identifies the purpose of the trail. In this case, you're creating a trail that logs management events.

7. In **Management Events**, make sure **Read/Write events** is set to **All**.

8. In **Data Events**, do not make any changes. This trail will not log any data events.

9. Create a new S3 bucket for the logs:

    1. In **Storage Location**, in **Create a new S3 bucket**, choose **Yes**.

    2. In **S3 bucket**, give your bucket a name, such as _my-bucket-for-storing-cloudtrail-logs_.

        The name of your S3 bucket must be globally unique. For more information about S3 bucket naming requirements, see the [AWS CloudTrail User Guide](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-s3-bucket-naming-requirements.html).

    3. Under **Advanced**, choose **Yes** for both **Encrypt log files with SSE-KMS** and **Enable log file validation**.

10. Choose **Create**.
