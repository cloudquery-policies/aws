SELECT account_id, 
    region, 
    arn, 
    name, 
    format('project should use OAUTH for auth instead of %s', source_auth_type) as cq_reason
FROM aws_codebuild_projects
WHERE (source_type = 'GITHUB'
    OR source_type = 'BITBUCKET')
    AND source_auth_type != 'OAUTH';
