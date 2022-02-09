-- List all shared RDS DB snapshots --
SELECT * FROM aws_rds_db_snapshots d,
            jsonb_to_recordset(d.attributes) AS items("AttributeName" text, "AttributeValues" text)
WHERE "AttributeName" = 'restore' AND "AttributeValues" != '[]';
