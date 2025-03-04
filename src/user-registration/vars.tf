variable "aws_region" {
  description = "The AWS region to deploy resources."
  type        = string
  default     = "af-south-1"
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)."
  type        = string
  default     = "dev"
}