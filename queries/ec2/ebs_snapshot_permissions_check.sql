WITH snapshot_access_groups AS (
   SELECT account_id, region, snapshot_id, jsonb_array_elements(create_volume_permissions) ->> 'group' AS "group", jsonb_array_elements(create_volume_permissions) ->> 'user_id' AS "user_id"
FROM aws_ec2_ebs_snapshots) SELECT DISTINCT *
FROM snapshot_access_groups
WHERE "group" = 'all'
--this is under question because trusted accounts(user_id) do not violate this control
OR user_id IS DISTINCT FROM '';