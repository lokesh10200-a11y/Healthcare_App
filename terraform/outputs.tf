output "acr_login_server" {
  value = data.azurerm_container_registry.acr.login_server
}

output "aks_name" {
  value = data.azurerm_kubernetes_cluster.aks.name
}

output "resource_group_name" {
  value = data.azurerm_resource_group.rg.name
}

output "application_insights_key" {
  value     = azurerm_application_insights.appi.instrumentation_key
  sensitive = true
}