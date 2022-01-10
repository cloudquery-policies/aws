SELECT
    account_id, region, arn, name
FROM aws_dax_clusters WHERE sse_description_status IS DISTINCT FROM 'ENABLED'
