SELECT account_id, arn, region, 'SSM documents should not be public' as cq_reason
FROM aws_ssm_documents
WHERE 'all' = ANY(account_ids)
                  AND owner IN (SELECT account_id FROM aws_accounts)
