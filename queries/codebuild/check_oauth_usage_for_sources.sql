SELECT account_id, region, arn, name
FROM aws_codebuild_projects
WHERE (source_type = 'GITHUB'
    OR source_type = 'BITBUCKET')
    AND source_auth_type != 'OAUTH';
