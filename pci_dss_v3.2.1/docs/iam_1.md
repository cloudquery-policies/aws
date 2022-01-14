# IAM root user access key should not exist

This control checks whether user access keys exist for the root user.

> This control is not supported in Africa (Cape Town) or Asia Pacific (Osaka).

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements:

**PCI DSS 2.1: Always change vendor-supplied defaults and remove or disable unnecessary default accounts before installing a system on the network.**

> The AWS account root user is the most privileged AWS user. AWS access keys provide programmatic access to a given account.
>
> No access keys should be created for the root user, as this may violate the requirement to remove or disable unnecessary default accounts.

**PCI DSS 2.2: Develop configuration standards for all system components. Assure that these standards address all known security vulnerabilities and are consistent with industry-accepted system hardening standards.**

> The root user is the most privileged AWS user. AWS access keys provide programmatic access to a given account.
>
> No access keys should be created for the root user, as this may violate the requirement to implement system hardening configurations.

**PCI DSS 7.2.1: Establish an access control system(s) for systems components that restricts access based on a user’s need to know, and is set to "deny all" unless specifically allowed. This access control system(s) must include the following: Coverage of all system components.**

> The root user is the most privileged AWS user. AWS access keys provide programmatic access to a given account.
>
> No access keys should be created for the root user. Doing so might violate the requirement to ensure access to systems components is restricted to least privilege necessary, or a user’s need to know.

## Remediation

**To delete access keys**

1. Log in to your account using the root user credentials.
2. Choose the account name near the top-right corner of the page and then choose **My Security Credentials**.
3. In the pop-up warning, choose **Continue to Security Credentials**.
4. Choose **Access keys (access key ID and secret access key)**.
5. To permanently delete the key, choose **Delete** and then choose **Yes**. You cannot recover deleted keys.
6. If there is more than one root user access key, then repeat steps 4 and 5 for each key.
