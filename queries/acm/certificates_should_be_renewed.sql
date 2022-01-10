SELECT arn
FROM aws_acm_certificates
WHERE not_after < NOW() AT TIME ZONE 'UTC' + INTERVAL '30' DAY -- noqa
