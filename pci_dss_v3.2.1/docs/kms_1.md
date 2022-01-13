# KMS key rotation should be enabled

This control checks that key rotation is enabled for each KMS key. It does not check KMS keys that have imported key material.

You should ensure keys that have imported material and those that are not stored in AWS KMS are rotated. AWS managed keys are rotated once every 3 years.

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements:

**PCI DSS 3.6.4: Cryptographic keys should be changed once they have reached the end of their cryptoperiod.**

> While PCI DSS does not specify the time frame for cryptoperiods, if key rotation is enabled, rotation occurs annually by default.
>
> If you use a KMS key to encrypt cardholder data, you should enable key rotation.
>
> This is a method used to change cryptographic keys once they have reached the end of their cryptoperiod.

## Remediation

**To enable KMS key rotation**

1. Open the AWS KMS console at https://console.aws.amazon.com/kms
2. To change the AWS Region, use the Region selector in the upper-right corner of the page.
3. Choose **Customer managed keys**.
4. In the **Alias** column, choose the alias of the key to update.
5. Choose **Key rotation**.
6. Select **Automatically rotate this KMS key every year** and then choose **Save**.
