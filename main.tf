resource "azurerm_resource_group" "resource_group_tf" {
  name     = "lab_resource_group"
  location = var.lab_project_resoucegroup_location
}

resource "azurerm_virtual_network" "vnet_tf" {
  name                = "lab_vnet"
  location            = azurerm_resource_group.resource_group_tf.location
  resource_group_name = azurerm_resource_group.resource_group_tf.name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "subnet_tf" {
  name                 = "lab_subnet"
  resource_group_name  = azurerm_resource_group.resource_group_tf.name
  virtual_network_name = azurerm_virtual_network.vnet_tf.name
  address_prefixes     = ["10.1.0.0/24"]
}
