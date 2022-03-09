# You should probably dictate the version & source of Gaia you'd like to use
terraform {
    required_providers {
          gaia = { 
            source = "Max-Gabriel-Susman/gaia"
            version = "=0.14.6"
          }
    }
}

# Configure Gaia - we can use provider configurations to manually dictate the concretion of the archetypal resources
provider "gaia" {
  project = ""
  region = ""
  features {}
}

# Create an archetypal resource group
resource "gaia_archetypal_resource_group" "example" {
  name = "example-archetypal-resources"
  location = "West Europs"
}

# Create an archetypal resource
resource "gaia_archetypal_virtual_machine" "example" {
  name = "example-archetypal-virtual-machine"
  archetypal_resource_group_name = gaia_archetypal_resource_group.name
  archetypal_resource_group_location = gaia_archetypal_resource_group.location
  # address_space       = ["10.0.0.0/16"] this might not actually apply to this resource, I guess we'll just have to see
}