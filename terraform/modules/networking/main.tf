# 1. Define the Core Virtual Network (The Hub Network)
resource "azurerm_virtual_network" "hub_vnet" {
  name                = "dev-hub-vnet"
  location            = "East US"
  resource_group_name = "enterprise-platform-rg"
  address_space       = ["10.0.0.0/16"]
}

# 2. Create a Subnet inside the network for your Kubernetes (AKS) cluster
resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-core-subnet"
  resource_group_name  = "enterprise-platform-rg"
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
