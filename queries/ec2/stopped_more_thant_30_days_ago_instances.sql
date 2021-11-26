SELECT *
FROM aws_ec2_instances
WHERE state_name = 'stopped'
  AND NOW() - TO_TIMESTAMP(SUBSTRING(state_transition_reason FROM '\(([^\)]+)'), 'yyyy-MM-dd HH:mi:ss') >
      INTERVAL '30' DAY;