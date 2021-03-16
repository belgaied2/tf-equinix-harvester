terraform {
  required_providers {
    metal = {
      source = "equinix/metal"
      version = "1.0.0"
    }
  }
}

# Configure the Equinix Metal Provider.
provider "metal" {
  auth_token = var.auth_token
}

# Declare your project ID
#
# You can find ID of your project form the URL in the Equinix Metal web app.
# For example, if you see your devices listed at
# https://console.equinix.com/projects/352000fb2-ee46-4673-93a8-de2c2bdba33b
# .. then 352000fb2-ee46-4673-93a8-de2c2bdba33b is your project ID.
locals {
  project_id = var.project_uuid
}

data "metal_project_ssh_key" "project_key" {
  search = "MacOSsKey"
  project_id = local.project_id
}


# Create a device and add it to tf_project_1
resource "metal_device" "harvester1" {
  hostname         = "harvester-1"
  plan             = "c3.small.x86"
  facilities       = ["ny5"]
  operating_system = "custom_ipxe"
  billing_cycle    = "hourly"
  project_id       = local.project_id
  ipxe_script_url  = "https://raw.githubusercontent.com/belgaied2/hvst-ipxe/main/equinix/ipxe-create"
  always_pxe       = "false" 
#   storage = jsonencode(
#             {
#                 disks       = null
#                 filesystems = null
#             }
#         )

  # if you have created project with metal_project resource, refer to its ID
  # project_id       = metal_project.cool_project.id
}