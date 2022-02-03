-- List all shared EC2 EBS Volume snapshots --
SELECT * FROM aws_ec2_ebs_snapshots d,
              jsonb_to_recordset(d."create_volume_permissions") as items("group" text, "user_id" text)
WHERE d."create_volume_permissions" != '[]';