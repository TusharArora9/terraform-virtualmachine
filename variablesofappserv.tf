variable "rg-name" {
    type = string
    description = "Resource Group Name"
    default = "shubham-resource-group"
}

variable "rg-location" {
    type = string
    description = "Resource Group Location"
    default = "East US"
}

variable "appserv-name" {
    type = string
    description = "App Service Name"
    default = "shubham-app-serv"
}

variable "appservplan-name" {
    type = string
    description = "App Service Plan Name"
    default = "shubham-app-serv-plan"
}
