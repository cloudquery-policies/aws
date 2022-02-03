-- List all shared RDS cluster snapshots --
SELECT * FROM aws_rds_cluster_snapshots d,
              jsonb_to_recordset(d."attributes") as items("AttributeName" text, "AttributeValues" text)
WHERE "AttributeName" = 'restore' AND "AttributeValues" != '[]';