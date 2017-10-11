variable "region" {
  default = "us-central1"
}

variable "prefix" {
  default = "devfest"
}

variable "nat_tag" {
  default = "devfest-nat"
}

variable "network_cidr" {
  default = "10.10.10.0/24"
}

variable "bastion_tag" {
  default = "devfest-bastion"
}

variable "server_tag" {
  default = "devfest-server"
}

variable "worker_tag" {
  default = "devfest-worker"
}

variable "ssh_pubkey_location" {
  default = "~/.ssh/id_rsa.pub"
}

# TODO (data sources): https://github.com/terraform-providers/terraform-provider-google/pull/567
variable "internal_and_http_healthcheck_cidrs" {
  default = ["130.211.0.0/22", "35.191.0.0/16"]
}

variable "admin_cidr_ingress" {
  description = "From where you're going to connect to bastion (CIDR)"
}
variable "dns_zone_name" {
  description = "Name of the managed DNS zone"
}
