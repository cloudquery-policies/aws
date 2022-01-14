# Password policies for IAM users should have strong configurations

This control checks whether the account password policy for IAM users uses the following minimum PCI DSS configurations.

* `RequireUppercaseCharacters` – Require at least one uppercase character in password. (Default `= true`)
* `RequireLowercaseCharacters` – Require at least one lowercase character in password. (Default `= true`)
* `RequireNumbers` – Require at least one number in password. (Default `= true`)
* `MinimumPasswordLength` – Password minimum length. (Default = 7 or longer)
* `PasswordReusePrevention` – Number of passwords before allowing reuse. (Default = 4)
* `MaxPasswordAge` – Number of days before password expiration. (Default = 90)

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements.

**PCI DSS 8.1.4: Remove/disable inactive user accounts within 90 days.**

> If you have IAM users in your AWS account, you should configure the IAM password policy appropriately. Not securing IAM users' passwords might violate the requirement to remove or disable inactive user accounts within 90 days. By default, the `MaxPasswordAge` parameter is set to 90 days. After their password expires, IAM users cannot access their account until the password is changed, which disables the user.

**PCI DSS 8.2.3: Passwords/passphrases must meet the following: Require a minimum length of at least seven characters and Contain both numeric and alphabetic characters.**

> If you have IAM users in your AWS account, the IAM password policy should be configured appropriately. Not securing IAM users' passwords might violate the requirement for a password to have a minimum length of at least seven characters. It might also violate the requirements to contain both numeric and alphabetic characters. By default, `MinimumPasswordLength` is `7`, `RequireUppercaseCharacters` is `true`, and `RequireLowercaseCharacters` is `true`.

**PCI DSS 8.2.4: Change user passwords/passphrases at least once every 90 days.**

> If you have IAM users in your AWS account, the IAM password policy should be configured appropriately. Not securing IAM users' passwords might violate the requirement to change user passwords or passphrases at least once every 90 days. By default, the `MaxPasswordAge` parameter is set to 90 days.
>
> After the password expires, the IAM user cannot access the account until the password is changed.

**PCI DSS 8.2.5: Do not allow an individual to submit a new password/passphrase that is the same as any of the last four passwords/passphrases he or she has used.**

> If you have IAM users in your AWS account, the IAM password policy should be configured appropriately. Not securing IAM users' passwords might violate the requirement to not allow individuals to submit a new password or passphrase that is the same as any of their previous four passwords or passphrases. By default, `PasswordReusePrevention` is set to `4`, which prevents users from reusing their last four passwords.

## Remediation

You can use the IAM console to modify the password policy.

**To modify the password policy**

1. Open the IAM console at https://console.aws.amazon.com/iam/.
2. Under **Access management**, choose **Account settings**.
3. Select **Prevent password reuse**. For **Number of passwords to remember**, enter _24_.
4. Choose **Change password policy**.
5. Select **Require at least one uppercase letter from Latin alphabet (A-Z)**.
6. Select **Require at least one lowercase letter from Latin alphabet (a-z)**.
7. Select **Require at least one non-alphanumeric character (!@#$%^&*()_+-=[]{}|')**.
8. Select **Require at least one number**.
9. For **Enforce minimum password length**, enter _14_.
10. Select **Enable password expiration**. For **Expire passwords in day(s)**, enter _90_.
11. Choose **Save changes**.
