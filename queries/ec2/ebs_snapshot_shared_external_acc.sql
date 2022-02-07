-- EBS snapshots shared with external accounts
SELECT *, 'arn:aws:ec2:'||region||'::snapshot/'||snapshot_id as arn
FROM aws_ec2_ebs_snapshots d,
     jsonb_to_recordset(d."create_volume_permissions") as items("group" text, "user_id" text)
WHERE d."create_volume_permissions" != '[]'
  AND "group" != 'all'
  AND "user_id" NOT IN (SELECT account_id FROM aws_accounts)
ORDER BY account_id, arn