-- WAF Classic
SELECT account_id,
       arn
FROM aws_waf_web_acls
WHERE logging_configuration IS NULL
      OR logging_configuration = '{}'

UNION
-- WAF V2
SELECT account_id,
       arn
FROM aws_wafv2_web_acls
WHERE logging_configuration IS NULL
      OR logging_configuration = '{}';
