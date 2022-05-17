SELECT account_id, region, id, 'you should terminate your instance after 30 days of being stopped' as cq_reason
FROM aws_ec2_instances
WHERE state_name = 'stopped'
      AND NOW() - state_transition_reason_time >
      INTERVAL '30' DAY; -- noqa
