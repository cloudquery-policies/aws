SELECT account_id, region, id
FROM aws_ec2_instances
WHERE state_name = 'stopped'
  AND NOW() - state_transition_reason_time >
      INTERVAL '30' DAY;
