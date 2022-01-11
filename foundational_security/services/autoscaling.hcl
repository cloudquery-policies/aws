policy "autoscaling" {
    title = "autoscaling controls"
    check "1" {
      query = file("queries/autoscaling/autoscaling_groups_elb_check.sql")
    }
  }