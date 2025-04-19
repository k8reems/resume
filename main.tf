provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resume" {
  name     = "resume-rg"
  location = "centralus"
}

resource "azurerm_storage_account" "resume" {
  name                     = "resumeweb${lower(substr(md5(azurerm_resource_group.resume.name), 0, 8))}"
  resource_group_name      = azurerm_resource_group.resume.name
  location                 = azurerm_resource_group.resume.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  static_website {
    index_document = "index.html"
  }
}

output "website_url" {
  value = azurerm_storage_account.resume.primary_web_endpoint
  description = "The URL of the hosted static website"
}

output "storage_account_name" {
  value = azurerm_storage_account.resume.name
  description = "The name of the storage account hosting the resume"
}