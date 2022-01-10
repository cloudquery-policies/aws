SELECT
    account_id
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
