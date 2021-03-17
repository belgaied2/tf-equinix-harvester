# Automate with Terraform the deployment of Harvester on Equinix Metal using iPXE
Since [Harvester](https://github.com/harvesterci) is a new project, its documentation is still missing some details on a number of features. One of them is the way your can deploy Harvester with Cloud Providers. This repository aims at providing some Terraform simple scripts for deploying a Harvester installation on Equinix Metal.

  *__NOTE__: The Terraform scripts in this repository make use of complementary iPXE and cloud-init scripts available [in this GitHub](https://github.com/belgaied2/hvst-ipxe) repo.*

## Usage
As a pre-requisite, you need to have Terraform 0.13 or later installed on your system.

- Clone this repository
- Set up the `project_uuid` and `auth_token` terraform variables
- If needed, add your backend configuration for the Terraform state file.
- Run `terraform plan` and `terraform apply`

## Variables
This Terraform configuration makes use of the following variables:

| Variable Name | Description | Required | Default |
|---|---|---|---|
| auth_token | API Token for programmatically accessing Equinix Metal | Yes |  |
| project_uuid | Project UUID for Equinix BareMetal | Yes |  |

## What this configuration does
This Terraform configuration will run a single Harvester server on Equinix. The installation will be fairly standard. The token to make further servers join the cluster is `token`.

