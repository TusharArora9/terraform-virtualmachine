terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.32.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group_shubham" {
  name     = "${var.rg-name}"
  location = "${var.rg-location}"
}

resource "azurerm_virtual_network" "virtual_network_shubham" {
  name                = "${var.vnet-name}"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.resource_group_shubham.location}"
  resource_group_name = "${azurerm_resource_group.resource_group_shubham.name}"
}

resource "azurerm_subnet" "subnet_shubham" {
  name                 = "${var.subnet-name}"
  resource_group_name  = "${azurerm_resource_group.resource_group_shubham.name}"
  virtual_network_name = "${azurerm_virtual_network.virtual_network_shubham.name}"
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "network_interface_shubham" {
  name                = "${var.network-interface-name}"
  location            = "${azurerm_resource_group.resource_group_shubham.location}"
  resource_group_name = "${azurerm_resource_group.resource_group_shubham.name}"

  ip_configuration {
    name                          = "${var.ip-name}"
    subnet_id                     = "${azurerm_subnet.subnet_shubham.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "virtual_machine_shubham" {
  name                = "${var.vm-name}"
  resource_group_name = "${azurerm_resource_group.resource_group_shubham.name}"
  location            = "${azurerm_resource_group.resource_group_shubham.location}"
  size                = "Standard_D2s_v3"
  admin_username      = "shubham-user"
  admin_password      = "Password@12345"
  network_interface_ids = [
    "${azurerm_network_interface.network_interface_shubham.id}",
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
