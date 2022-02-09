-- RDS snapshots shared with "external" accounts
SELECT *
FROM aws_rds_db_snapshots d, jsonb_to_recordset(d.attributes) AS items("AttributeName" text, "AttributeValues" text array)
WHERE "AttributeName" = 'restore'
-- Exclude sharing with any accounts in our purview
  AND NOT ((SELECT ARRAY (SELECT account_id from aws_accounts)) && "AttributeValues")
-- Exclude no sharing at all
  AND cardinality("AttributeValues") <> 0
-- Exclude public sharing, which is dealth with by another query
  AND 'all' != ANY ("AttributeValues")
ORDER BY account_id, arn