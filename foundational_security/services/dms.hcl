policy "dms" {
    title = "AWS config controls"
    check "1" {
      title = "AWS Config should be enabled"
      query = file("queries/dms/replication_not_public.sql")
    }
  }