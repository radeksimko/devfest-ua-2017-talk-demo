provider "google" {
  region = "${var.region}"
}

data "google_compute_zones" "available" {}
