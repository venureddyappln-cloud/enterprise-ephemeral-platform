variable "resource_group_name" {
  type        = string
  default     = "enterprise-platform-rg"
  description = "The name of the Azure Resource Group where networking will live."
}

variable "location" {
  type        = string
  default     = "East US"
  description = "The Azure region for the deployment."
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "The deployment context (e.g., dev, staging, prod)."
}
