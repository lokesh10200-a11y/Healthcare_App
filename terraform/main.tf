provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "healthcare-rg"
  location = "Central India"
}

resource "azurerm_container_registry" "acr" {
  name                = "healthcareacr123"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
}