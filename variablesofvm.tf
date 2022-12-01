variable "rg-name" {
    type = string
    description = "Resource Group Name"
    default = "shubham-resource-group"
}

variable "rg-location" {
    type = string
    description = "Resource Group Location"
    default = "West Europe"
}

variable "vnet-name" {
    type = string
    description = "Virtual Network Name"
    default = "shubham-virtual-network"
}

variable "subnet-name" {
    type = string
    description = "Subnet Name"
    default = "shubham-subnet"
}

variable "network-interface-name" {
    type = string
    description = "Network Interface Name"
    default = "shubham-network-interface"
}

variable "ip-name" {
    type = string
    description = "IP Name"
    default = "shubham-ip"
}

variable "vm-name" {
    type = string
    description = "VM Name"
    default = "shubham-vir-mac"
}
