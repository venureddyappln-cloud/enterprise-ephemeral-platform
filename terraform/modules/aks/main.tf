# 1. Provision an Azure Kubernetes Service (AKS) Cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "dev-platform-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "devplatformaks"

  # 2. Configure the default system node pool (The actual server VMs)
  default_node_pool {
    name           = "systempool"
    node_count     = 1
    vm_size        = "Standard_D2s_v3"
    vnet_subnet_id = var.aks_subnet_id
  }

  # 3. Required Modern Azure Provider Block: Node Provisioning Profile
  node_provisioning_profile {
    mode              = "Manual" # Standard industrial orchestration tier
  }

  # 4. Secure identity management
  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

