terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.33.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group_shubham" {
  name     = "shubham-resource-group"
  location = "East US"
}

resource "azurerm_service_plan" "app_service_plan_shubham" {
  name                = "shubham-app-serv-plan"
  resource_group_name = azurerm_resource_group.resource_group_shubham.name
  location            = azurerm_resource_group.resource_group_shubham.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "app_service_shubham" {
  name                = "shubham-app-serv"
  resource_group_name = azurerm_resource_group.resource_group_shubham.name
  location            = azurerm_service_plan.app_service_plan_shubham.location
  service_plan_id     = azurerm_service_plan.app_service_plan_shubham.id

  site_config {}
}
