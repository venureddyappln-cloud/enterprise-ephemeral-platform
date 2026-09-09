output "vnet_id" {
  value       = azurerm_virtual_network.hub_vnet.id
  description = "The unique structural ID of the main virtual network."
}

output "aks_subnet_id" {
  value       = azurerm_subnet.aks_subnet.id
  description = "The specific identifier for the Kubernetes hosting subnet."
}
