# 1. Instantiate the reusable network module we created earlier
module "network_layer" {
  source              = "../../modules/networking"
  environment         = "dev"
  location            = "East US"
  resource_group_name = "enterprise-platform-rg"
}

# 2. Instantiate the AKS cluster and feed it the subnet outputs from the network layer
module "kubernetes_layer" {
  source              = "../../modules/aks"
  location            = "East US"
  resource_group_name = "enterprise-platform-rg"
  
  # This line links your AKS cluster securely to your Hub network subnet!
  aks_subnet_id       = module.network_layer.aks_subnet_id
}
