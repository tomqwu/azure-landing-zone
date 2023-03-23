# Provider
provider "azurerm" {
  features {}
}

# Resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West US 2"
}

# Landing Zone
module "landing_zone" {
  source  = "Azure/caf/azurerm"
  version = "0.4.18"

  prefix                = "example"
  resource_group_name   = azurerm_resource_group.example.name
  location              = azurerm_resource_group.example.location
  convention            = "cafclassic"
  global_settings       = var.global_settings
  diagnostics_settings  = var.diagnostics_settings
  security_settings     = var.security_settings
}

# Azure Kubernetes Service (AKS)
module "aks" {
  source  = "Azure/aks/azurerm"
  version = "0.2.2"

  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  prefix              = "example"

  client_id           = var.client_id
  client_secret       = var.client_secret

  kubernetes_version  = var.kubernetes_version
  node_pool           = var.node_pool
  tags                = var.tags
}

# Azure API Management (APIM)
module "apim" {
  source  = "Azure/apim/azurerm"
  version = "0.1.1"

  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  prefix              = "example"

  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
}

# Azure Container Apps
module "container_app" {
  source  = "Azure/container-app/azurerm"
  version = "0.1.0"

  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  prefix              = "example"

  container_app_name  = var.container_app_name
  image               = var.image
  environment         = var.environment
}

# Azure App Service Environment (ASE)
module "ase" {
  source  = "Azure/app-service-environment/azurerm"
  version = "0.1.0"

  resource_group_name  = azurerm_resource_group.example.name
  location             = azurerm_resource_group.example.location
  prefix               = "example"

  ase_name             = var.ase_name
  ase_subnet_id        = var.ase_subnet_id
}
