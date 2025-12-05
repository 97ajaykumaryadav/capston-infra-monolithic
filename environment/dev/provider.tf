terraform {
  backend "azurerm" {
    resource_group_name = "rg-it"
    storage_account_name = "stcapstondevcic01"
    container_name = "capstoncontainer"
    key = "capstonfstate"
    
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
}

provider "azurerm" {
  features {}
    
  subscription_id = "792b5051-461b-4568-abbd-b3d549f22f8c"
}