terraform {
  backend "azurerm" {
    resource_group_name  = "GeneralRG"
    storage_account_name = "tfstateaccount041825"
    container_name      = "tfstate"
    key                 = "resume.tfstate"
  }
}