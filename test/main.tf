provider "google" {
  region = "europe-west2"
}

resource "google_compute_instance" "frontend" {
  name         = "devfest-frontend"
  machine_type = "n1-standard-1"
  zone         = "europe-west2-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-8"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
    }
  }
}

resource "google_dns_managed_zone" "devfest" {
  name = "devfest"
  dns_name = "devfest.gdg.org.ua."
}

resource "google_dns_record_set" "www" {
  managed_zone = "${google_dns_managed_zone.devfest.name}"
  name = "www.devfest.gdg.org.ua."
  type = "A"
  ttl  = 120

  rrdatas = [
    "${google_compute_instance.frontend.network_interface.0.access_config.0.assigned_nat_ip}"
  ]
}
