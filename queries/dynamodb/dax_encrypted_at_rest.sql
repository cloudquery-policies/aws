SELECT
    account_id, region, arn, name, 'encryption at rest should be enabled' as cq_reason
FROM aws_dax_clusters WHERE sse_description_status IS DISTINCT FROM 'ENABLED'
