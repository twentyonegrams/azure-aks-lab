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

resource "azurerm_kubernetes_cluster" "aks_cluster_tf" {
  name                = "lab_aks_cluster"
  location            = azurerm_resource_group.resource_group_tf.location
  resource_group_name = azurerm_resource_group.resource_group_tf.name
  dns_prefix          = "lab-dns"

  node_provisioning_profile {
    mode = "Manual"
  }

  default_node_pool {
    name           = "labdefault"
    node_count     = 2
    vm_size        = "Standard_D2ds_v4"
    vnet_subnet_id = azurerm_subnet.subnet_tf.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    pod_cidr            = "172.16.0.0/20"
    service_cidr        = "192.168.0.0/26"
    dns_service_ip      = "192.168.0.10"
  }
}