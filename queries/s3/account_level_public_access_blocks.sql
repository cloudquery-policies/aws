SELECT
    account_id,
	CONCAT('s3 public block not configured correctly:', 
		   CASE WHEN config_exists IS NOT TRUE THEN ' configuration does not exist' ELSE '' END,
		   CASE WHEN block_public_acls IS NOT TRUE THEN ',  not blocking public acls' ELSE '' END,
		   CASE WHEN block_public_policy IS NOT TRUE THEN ', not blocking public policies' ELSE '' END,
           CASE WHEN ignore_public_acls IS NOT TRUE THEN ', not ignoring public acls' ELSE '' END,
           CASE WHEN restrict_public_buckets IS NOT TRUE THEN ', not restricting public buckets' ELSE '' END
		  ) as cq_reason
FROM
    aws_accounts
WHERE
    account_id NOT IN (
        -- Find all accounts that do not have a s3 public block (either not configured or allows public access)
        SELECT
            account_id
        FROM
            aws_s3_account_config
        WHERE
            config_exists = TRUE
            AND block_public_acls = TRUE
            AND block_public_policy = TRUE
            AND ignore_public_acls = TRUE
            AND restrict_public_buckets = TRUE
    )
