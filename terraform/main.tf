resource "azurerm_log_analytics_workspace" "law" {
  name                = "healthcare-law"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  sku               = "PerGB2018"
  retention_in_days = 30
}

resource "azurerm_application_insights" "appi" {
  name                = "healthcare-appinsights"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  workspace_id     = azurerm_log_analytics_workspace.law.id
  application_type = "web"
}