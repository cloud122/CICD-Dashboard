resource "aws_ecs_task_definition" "my_task" {
  count = var.create_CICD_Dashboard ? 1 : 0
  family                   = "my-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory

  execution_role_arn = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([{
    name  = "my-container"
    image = var.image_url
  }])
}