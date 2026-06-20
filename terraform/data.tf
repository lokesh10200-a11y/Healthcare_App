data "azurerm_resource_group" "rg" {
  name = "healthcare_app_project1"
}

data "azurerm_container_registry" "acr" {
  name                = "healthcareapplokesh001"
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_kubernetes_cluster" "aks" {
  name                = "healthcare-aks"
  resource_group_name = data.azurerm_resource_group.rg.name
}