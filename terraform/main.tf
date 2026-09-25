terraform {
  required_providers {
    vbox = {
      source  = "eran132/vbox"
      version = "2.1.1"
    }
  }
}

provider "vbox" {}

resource "virtualbox_nat_network" "employee_platform" {
  provider = vbox

  name         = "employee-platform-network"
  network      = "10.10.10.0/24"
  dhcp_enabled = true
  ipv6         = false
  enabled      = true
}

output "network_name" {
  value = virtualbox_nat_network.employee_platform.name
}

output "network_cidr" {
  value = virtualbox_nat_network.employee_platform.network
}