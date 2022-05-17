SELECT DISTINCT 
    p.account_id, 
    p.region, 
    p.name, 
    format('the following environment variable may contain sensitive information and is stored in plaintext: %s', e.name) as cq_reason
FROM aws_codebuild_projects p
     JOIN aws_codebuild_project_environment_variables e ON
    p.cq_id = e.project_cq_id
WHERE e.type = 'PLAINTEXT'
      AND (UPPER(e.name) LIKE '%ACCESS_KEY%' OR UPPER(e.name) LIKE '%SECRET%' OR UPPER(e.name) LIKE '%PASSWORD%');
