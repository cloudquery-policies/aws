SELECT account_id,
       region,
       id,
       'delete ACL as it is not in use' as cq_reason
FROM aws_ec2_network_acls a
     LEFT JOIN
        aws_ec2_network_acl_associations aa ON a.cq_id = aa.network_acl_cq_id
WHERE aa.cq_id IS NULL;
