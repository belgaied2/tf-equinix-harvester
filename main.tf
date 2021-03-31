
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
# resource "metal_device" "harvester1" {
#   hostname         = "harvester-1"
#   plan             = "c3.small.x86"
#   facilities       = ["sv15"]
#   operating_system = "custom_ipxe"
#   billing_cycle    = "hourly"
#   project_id       = local.project_id
#   ipxe_script_url  = "https://raw.githubusercontent.com/belgaied2/hvst-ipxe/main/equinix/ipxe-create"
#   always_pxe       = "false" 
#   project_ssh_key_ids = [ data.metal_project_ssh_key.project_key.id ]
#   # if you have created project with metal_project resource, refer to its ID
#   # project_id       = metal_project.cool_project.id
# }

# Create a spot market device add it to tf_project_1
resource "metal_spot_market_request" "req" {
  project_id    = local.project_id
  max_bid_price = 0.70
  facilities    = ["sv15"]
  devices_min   = 1
  devices_max   = 1

  instance_parameters {
    # hostname         = "testspot"
    # billing_cycle    = "hourly"
    # operating_system = "coreos_stable"
    # plan             = "t1.small.x86"
    hostname         = "harvester-1"
    plan             = "m3.large.x86"
    # facilities       = ["sv15"]
    operating_system = "custom_ipxe"
    billing_cycle    = "hourly"
    # project_id       = local.project_id
    ipxe_script_url  = "https://raw.githubusercontent.com/belgaied2/hvst-ipxe/main/equinix/ipxe-create"
    always_pxe       = "false" 
    # project_ssh_key_ids = [ data.metal_project_ssh_key.project_key.id ]
    # if you have created project with metal_project resource, refer to its ID
    # project_id       = metal_project.cool_project.id
  }
}