terraform {
  required_providers {
    ns = {
      source = "nullstone-io/ns"
    }
  }
}

data "ns_workspace" "this" {}

// Generate a random suffix to ensure uniqueness of resources
resource "random_string" "resource_suffix" {
  length  = 5
  lower   = true
  upper   = false
  number  = false
  special = false
}

data "ns_connection" "sendgrid" {
  name = "sendgrid"
  type = "sendgrid/aws"
}

locals {
  tags                = data.ns_workspace.this.tags
  block_name          = data.ns_workspace.this.block_name
  resource_name       = "${data.ns_workspace.this.block_ref}-${random_string.resource_suffix.result}"
  api_key_secret_name = data.ns_connection.sendgrid.outputs.api_key_secret_name
  domain              = data.ns_connection.sendgrid.outputs.domain
}
