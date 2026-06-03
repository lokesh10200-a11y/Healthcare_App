terraform {
  required_version = ">= 1.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Existing Resource Group
data "azurerm_resource_group" "rg" {
  name = "healthcare_app_project1"
}

# Existing ACR
data "azurerm_container_registry" "acr" {
  name                = "healthcareappproject1rg"
  resource_group_name = data.azurerm_resource_group.rg.name
}

# Existing AKS
data "azurerm_kubernetes_cluster" "aks" {
  name                = "healthcareappproject1-aks"
  resource_group_name = data.azurerm_resource_group.rg.name
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "law" {
  name                = "healthcare-law"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  sku               = "PerGB2018"
  retention_in_days = 30
}

# Application Insights
resource "azurerm_application_insights" "appi" {
  name                = "healthcare-appinsights"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  workspace_id = azurerm_log_analytics_workspace.law.id
  application_type = "web"
}