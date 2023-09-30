output "ecs_task_arn" {
  description = "The ARN of the ECS task."
  value       = aws_ecs_task_definition.my_task.arn
}
