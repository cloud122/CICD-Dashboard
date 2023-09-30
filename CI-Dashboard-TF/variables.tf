variable "image_url" {
  description = "The URL of the Docker image."
}

variable "cpu" {
  description = "CPU units for the Fargate task."
  default     = 256
}

variable "memory" {
  description = "Memory for the Fargate task."
  default     = 512
}

variable "ENVIRONMENT" {
  type        = string
  description = "Name of ENVIRONMENT"
  default     = "test"
}

variable "create_CICD_Dashboard" {
  type        = bool
  description = "Flag to create Dashboard"
  default     = true
}