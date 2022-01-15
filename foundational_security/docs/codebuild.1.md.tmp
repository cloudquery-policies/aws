## \[CodeBuild\.1\] CodeBuild GitHub or Bitbucket source repository URLs should use OAuth<a name="fsbp-codebuild-1"></a>

**Category:** Protect > Secure development

**Severity:** Critical

**Resource type:** `AWS::CodeBuild::Project`

**AWS Config rule:** [https://docs.aws.amazon.com/config/latest/developerguide/codebuild-project-source-repo-url-check.html](https://docs.aws.amazon.com/config/latest/developerguide/codebuild-project-source-repo-url-check.html)

**Parameters:** None

This control checks whether the GitHub or Bitbucket source repository URL contains either personal access tokens or a user name and password\.

**Note**  
This control is not supported in the following Regions\.  
Africa \(Cape Town\)
Europe \(Milan\)
AWS GovCloud \(US\-East\)
AWS GovCloud \(US\-West\)

Authentication credentials should never be stored or transmitted in clear text or appear in the repository URL\. Instead of personal access tokens or user name and password, you should use OAuth to grant authorization for accessing GitHub or Bitbucket repositories\. Using personal access tokens or a user name and password could expose your credentials to unintended data exposure and unauthorized access\.

### Remediation<a name="codebuild-1-remediation"></a>

You can update your CodeBuild project to use OAuth\.

**To remove basic authentication / \(GitHub\) Personal Access Token from CodeBuild project source**

1. Open the CodeBuild console at [https://console\.aws\.amazon\.com/codebuild/](https://console.aws.amazon.com/codebuild/)\.

1. Choose the build project that contains personal access tokens or a user name and password\.

1. From **Edit**, choose **Source**\.

1. Choose **Disconnect from GitHub / Bitbucket**\.

1. Choose **Connect using OAuth**, then choose **Connect to GitHub / Bitbucket**\.

1. When prompted, choose **authorize as appropriate**\.

1. Reconfigure your repository URL and additional configuration settings, as needed\.

1. Choose **Update source**\.

For more information, refer to [CodeBuild use case\-based samples](https://docs.aws.amazon.com/codebuild/latest/userguide/use-case-based-samples.html) in the *AWS CodeBuild User Guide*\.

