SELECT
    aws_accounts.account_id,
	CONCAT('s3 public block not configured correctly:', 
		   CASE WHEN config_exists IS NOT TRUE THEN ' configuration does not exist' ELSE '' END,
		   CASE WHEN block_public_acls IS NOT TRUE THEN ',  not blocking public acls' ELSE '' END,
		   CASE WHEN block_public_policy IS NOT TRUE THEN ', not blocking public policies' ELSE '' END,
           CASE WHEN ignore_public_acls IS NOT TRUE THEN ', not ignoring public acls' ELSE '' END,
           CASE WHEN restrict_public_buckets IS NOT TRUE THEN ', not restricting public buckets' ELSE '' END
		  ) as cq_reason
FROM
    aws_accounts
LEFT JOIN aws_s3_account_config on aws_accounts.account_id = aws_s3_account_config.account_id
WHERE
	config_exists IS NOT TRUE
		OR block_public_acls IS NOT TRUE
		OR block_public_policy IS NOT TRUE
		OR ignore_public_acls IS NOT TRUE
		OR restrict_public_buckets IS NOT TRUE