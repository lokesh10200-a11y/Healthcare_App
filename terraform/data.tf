data "azurerm_resource_group" "rg" {
  name = "healthcare_app_project1"
}

data "azurerm_container_registry" "acr" {
  name                = "healthcareappproject1rg"
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_kubernetes_cluster" "aks" {
  name                = "healthcareappproject1-aks"
  resource_group_name = data.azurerm_resource_group.rg.name
}