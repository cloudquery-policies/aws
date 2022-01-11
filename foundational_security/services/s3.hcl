policy "s3" {
  title = "S3 controls"

  check "1" {
    title = "S3 Block Public Access setting should be enabled"
    query = file("queries/s3/account_level_public_access_blocks.sql")
  }

  check "2" {
    title = "S3 buckets should prohibit public read access"
    query = file("queries/s3/publicly_readable_buckets.sql")
  }

  check "3" {
    title = "S3 buckets should prohibit public write access"
    query = file("queries/s3/publicly_writable_buckets.sql")
  }

  check "4" {
    title = "S3 buckets should have server-side encryption enabled"
    query = file("queries/s3/s3_server_side_encryption_enabled.sql")
  }

  check "5" {
    title = "S3 buckets should require requests to use Secure Socket Layer"
    query = file("queries/s3/deny_http_requests.sql")
  }

  check "6" {
    title = "Amazon S3 permissions granted to other AWS accounts in bucket policies should be restricted"
    query = file("queries/s3/restrict_cross_account_actions.sql")
  }

  check "8" {
    title = "S3 Block Public Access setting should be enabled at the bucket level"
    query = file("queries/s3/account_level_public_access_blocks.sql")
  }
}