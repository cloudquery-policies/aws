SELECT account_id, arn, region,
	CONCAT(format('s3 bucket %s not configured correctly:', name), 
		   CASE WHEN block_public_acls IS NOT TRUE THEN ',  not blocking public acls' ELSE '' END,
		   CASE WHEN block_public_policy IS NOT TRUE THEN ', not blocking public policies' ELSE '' END,
           CASE WHEN ignore_public_acls IS NOT TRUE THEN ', not ignoring public acls' ELSE '' END,
           CASE WHEN restrict_public_buckets IS NOT TRUE THEN ', not restricting public buckets' ELSE '' END
		  ) as cq_reason
FROM aws_s3_buckets
WHERE block_public_acls IS NOT TRUE
    OR block_public_policy IS NOT TRUE
    OR ignore_public_acls IS NOT TRUE
    OR restrict_public_buckets IS NOT TRUE
