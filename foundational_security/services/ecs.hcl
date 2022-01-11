policy "ecs" {
    title = "ECS controls"
    check "1" {
      title = "Amazon ECS task definitions should have secure networking modes and user definitions"
      query = file("queries/ecs/task_definitions_secure_networking.sql")
    }

    check "2" {
      title = "Amazon ECS services should not have public IP addresses assigned to them automatically"
      query = file("queries/ecs/ecs_services_with_public_ips.sql")
    }
  }