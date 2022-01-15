policy "ecs" {
  title = "ECS controls"
  doc   = file("foundational_security/docs/ECS.md")
  check "ECS.1" {
    title = "Amazon ECS task definitions should have secure networking modes and user definitions"
    query = file("queries/ecs/task_definitions_secure_networking.sql")
    doc   = file("foundational_security/docs/ECS.1.md")
  }

  check "ECS.2" {
    title = "Amazon ECS services should not have public IP addresses assigned to them automatically"
    query = file("queries/ecs/ecs_services_with_public_ips.sql")
    doc   = file("foundational_security/docs/ECS.2.md")
  }
}