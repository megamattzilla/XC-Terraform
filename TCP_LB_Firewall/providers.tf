terraform {
  required_providers {
    volterra = {
      source = "volterraedge/volterra"
      version = "0.11.31"
    }
  }
}

provider "volterra" {
  api_p12_file     = "/path/to/.p12"
  ## Password: Set the P12 file password via the VES_P12_PASSWORD environment variable.
  url              = "https://your_tenant_here.volterra.io/api"
}