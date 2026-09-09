variable "resource_group_name" {
  type        = string
  default     = "enterprise-platform-rg"
  description = "The name of the Azure Resource Group where the AKS cluster will live."
}

variable "location" {
  type        = string
  default     = "East US"
  description = "The Azure region for the cluster deployment."
}

variable "aks_subnet_id" {
  type        = string
  description = "The Subnet ID passed from our networking module where AKS should be attached."
}
