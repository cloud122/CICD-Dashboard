resource "null_resource" "build_and_push_image" {
  triggers = {
    # Use triggers to force the provisioner to run when Dockerfile or application code changes
    always_run = "${timestamp()}"
  }

  # Run the provisioner on a local-exec provisioner block
  provisioner "local-exec" {
    command = <<EOT
      # Navigate to the directory containing your Dockerfile and application code
      cd /CI-Dashboard-App

      # Build the Docker image locally
      docker build -t flask-CI-Dashboard-App .

      # Authenticate Docker with ECR using AWS CLI
      aws ecr get-login-password --region your-region | docker login --username AWS --password-stdin your-account-id.dkr.ecr.your-region.amazonaws.com

      # Tag the Docker image with ECR repository URI
      docker tag my-app-image:latest your-account-id.dkr.ecr.your-region.amazonaws.com/your-repository-name:latest

      # Push the Docker image to ECR
      docker push your-account-id.dkr.ecr.your-region.amazonaws.com/your-repository-name:latest
    EOT
  }
}