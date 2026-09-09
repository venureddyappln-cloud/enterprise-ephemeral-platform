# 1. Provision an Azure Kubernetes Service (AKS) Cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "dev-platform-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "devplatformaks"

  # 2. Configure the default system node pool (The actual server VMs)
  default_node_pool {
    name       = "systempool"
    node_count = 1
    vm_size    = "Standard_D2s_v3" # Production-capable cost-efficient size
    
    # Industry-grade: Link this cluster directly into the subnet we made earlier!
    vnet_subnet_id = var.aks_subnet_id
  }

  # 3. Secure identity management
  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
