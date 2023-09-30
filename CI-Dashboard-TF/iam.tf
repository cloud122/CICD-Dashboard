resource "aws_iam_role" "ecs_execution_role" {
  count = var.create_CICD_Dashboard ? 1 : 0
  name = "ecs_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role" "dynamodb_role" {
  name = "DynamoDBRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"  # Adjust the service principal as needed
        },
      },
    ],
  })
}


resource "aws_iam_policy" "dynamodb_policy" {
  name        = "DynamoDBPolicy"
  description = "Allows read and write access to DynamoDB table"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
        ],
        Effect   = "Allow",
        Resource = "arn:aws:dynamodb:your-region:your-account-id:table/your-dynamodb-table-name",
      },
    ],
  })
}

resource "aws_iam_policy_attachment" "dynamodb_attachment" {
  policy_arn = aws_iam_policy.dynamodb_policy.arn
  roles      = [aws_iam_role.dynamodb_role.name]
}
