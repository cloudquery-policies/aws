# IAM user credentials should be disabled if not used within a predefined number of days

This control checks whether your IAM users have passwords or active access keys that have not been used within a specified number of days. The default is 90 days.

Security Hub strongly recommends that you do not generate and remove all access keys in your account. Instead, the recommended best practice is to either create one or more IAM roles or to use [federation](http://aws.amazon.com/identity/federation/). These practices allow your users to use their existing corporate credentials to sign in to the AWS Management Console console and AWS CLI.

Each approach has its use cases. Federation is generally better for enterprises that have an existing central directory or who plan to need more than the current quota of IAM users. Applications running outside of an AWS environment need access keys for programmatic access to AWS resources.

However, if the resources that need programmatic access run inside AWS, the best practice is to use IAM roles. You can use roles to grant a resource access without hardcoding an access key ID and secret access key into the configuration.

To learn more about protecting your access keys and account, see [Best practices for managing AWS access keys](https://docs.aws.amazon.com/general/latest/gr/aws-access-keys-best-practices.html) in the _AWS General Reference_. Also see the blog post [Guidelines for protecting your AWS account while using-programmatic access](http://aws.amazon.com/blogs/security/guidelines-for-protecting-your-aws-account-while-using-programmatic-access/).

If you already have an access key, we recommend that you remove or deactivate unused user credentials that are inactive for 90 days or longer.

This control only checks for inactive passwords or active access keys. It does not disable the account from use after 90 days. Customers are responsible for taking action and disabling the unused credentials.

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements.

**PCI DSS 8.1.4 Remove/disable inactive user accounts within 90 days.**

> If you use IAM passwords or access keys, ensure that they are monitored for use, and disabled if not used for 90 days. Allowing IAM user accounts to remain active with unused credentials might violate the requirement to remove/disable inactive user accounts within 90 days.

## Remediation

To get some of the information that you need to monitor accounts for dated credentials, use the IAM console. For example, when you view users in your account, there are columns for **Access key age**, **Password age**, and **Last activity**. If the value in any of these columns is greater than 90 days, make the credentials for those users inactive.

You can also use credential reports to monitor user accounts and identify those with no activity for 90 or more days. You can download credential reports in `.csv` format from the IAM console. For more information about credential reports, see [Getting credential reports for your AWS account](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_getting-report.html#getting-credential-reports-console) in the _IAM User Guide_.

After you identify the inactive accounts or unused credentials, use the following steps to disable them.

**To disable inactive accounts or unused IAM credentials**

1. Open the IAM console at https://console.aws.amazon.com/iam/.
2. Under **Access management**, choose **Users**.
3. Choose the name of the user that has credentials older than 90 days.
4. Choose **Security credentials**. Choose **Make inactive** for all sign-in credentials and access keys that were not used in 90 days or more.
