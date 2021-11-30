SELECT account_id,
       arn
FROM aws_wafv2_web_acls
WHERE logging_configuration IS NULL
   OR logging_configuration = '{}';
