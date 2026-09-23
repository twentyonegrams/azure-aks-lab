# pin the major version of Azure provider to 5.0
terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 5.0"
        }
    }
}

# configure the Microsoft Azure Provider
provider "azurerm" {
    features {}
    subscription_id = var.lab_project_subscription_id
}