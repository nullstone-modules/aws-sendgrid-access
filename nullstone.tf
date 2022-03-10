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
  tags          = data.ns_workspace.this.tags
  block_name    = data.ns_workspace.this.block_name
  resource_name = "${data.ns_workspace.this.block_ref}-${random_string.resource_suffix.result}"
  api_key       = data.ns_connection.sendgrid.api_key
  domain        = data.ns_connection.sendgrid.domain
}
