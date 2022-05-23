SELECT account_id, region, arn, 'certificate has less than 30 days to be renewed' as cq_reason
FROM aws_acm_certificates
WHERE not_after < NOW() AT TIME ZONE 'UTC' + INTERVAL '30' DAY -- noqa
