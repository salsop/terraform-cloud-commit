terraform {
  required_version = "~> 0.14"

  required_providers {

    panos = {
      source  = "paloaltonetworks/panos"
      version = "~> 1.8"
    }

    http = {
      version = "~> 2.1"
    }

  }
}

provider "panos" {
  hostname = var.panorama.hostname
  api_key  = var.panorama.api_key
}
