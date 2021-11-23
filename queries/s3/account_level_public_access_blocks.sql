select
    account_id
from
    aws_accounts
where
    account_id not in (
        -- Find all accounts that do not have a s3 public block (either not configured or allows public access)
        select
            account_id
        from
            aws_s3_account_config
        where
            config_exists = true
            AND block_public_acls = true
            AND block_public_policy = true
            AND ignore_public_acls = true
            AND restrict_public_buckets = true
    )