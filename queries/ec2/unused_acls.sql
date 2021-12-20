SELECT account_id,
       region,
       id
FROM aws_ec2_network_acls a
         LEFT JOIN aws_ec2_network_acl_associations aa ON a.cq_id = aa.network_acl_cq_id
WHERE aa.cq_id IS NULL;