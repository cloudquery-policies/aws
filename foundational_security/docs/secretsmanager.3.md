## \[SecretsManager\.3\] Remove unused Secrets Manager secrets

**Category:** Protect > Secure access management

**Severity:** Medium

**Resource type:** `AWS::SecretsManager::Secret`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/secretsmanager-secret-unused.html](https://docs.aws.amazon.com/config/latest/developerguide/secretsmanager-secret-unused.html)

**Parameters:** None

This control checks whether your secrets have been accessed within a specified number of days\. The default value is 90 days\. If a secret was not accessed within the defined number of days, this control fails\.

Deleting unused secrets is as important as rotating secrets\. Unused secrets can be abused by their former users, who no longer need access to these secrets\. Also, as more users get access to a secret, someone might have mishandled and leaked it to an unauthorized entity, which increases the risk of abuse\. Deleting unused secrets helps revoke secret access from users who no longer need it\. It also helps to reduce the cost of using Secrets Manager\. Therefore, it is essential to routinely delete unused secrets\.

**Note**  
This control is not supported in the following Regions:  
Asia Pacific \(Osaka\)
China \(Beijing\)
China \(Ningxia\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

### Remediation<a name="secretsmanager-3-remediation"></a>

You can delete inactive secrets from the Secrets Manager console\.

**To delete inactive secrets**

1. Open the Secrets Manager console at [https://console\.aws\.amazon\.com/secretsmanager/](https://console.aws.amazon.com/secretsmanager/)\.

1. To locate the secret, enter the secret name in the search box\.

1. Choose the secret to delete\. 

1. Under **Secret details**, from **Actions**, choose **Delete secret**\.

1. Under **Schedule secret deletion**, enter the number of days to wait before the secret is deleted\.

1. Choose **Schedule deletion**\.

