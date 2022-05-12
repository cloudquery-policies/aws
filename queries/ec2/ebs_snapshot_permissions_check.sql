WITH snapshot_access_groups AS (
    SELECT account_id,
           region,
           snapshot_id,
           JSONB_ARRAY_ELEMENTS(create_volume_permissions) ->> 'group' AS "group",
           JSONB_ARRAY_ELEMENTS(create_volume_permissions) ->> 'user_id' AS user_id
    FROM aws_ec2_ebs_snapshots
)

SELECT DISTINCT account_id,
           region,
           snapshot_id,
           "group",
           user_id,
        'update your EBS snapshot to make it private instead of public' as cq_reason
FROM snapshot_access_groups
WHERE "group" = 'all'
   -- this is under question because
   -- trusted accounts(user_id) do not violate this control
      OR user_id IS DISTINCT FROM '';
