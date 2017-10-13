job "pug-dispenser" {
  datacenters = ["gce-europe-west2"]
  type = "service"

  group "default" {
    count = 6

    task "pug-dispenser" {
      driver = "docker"

      config {
        image = "radeksimko/pug-dispenser:latest"
        args = ["-text=Hello"]
        port_map {
          "http" = 5678
        }
      }

      service {
        name = "pug-dispenser"
        port = "http"

        tags = ["urlprefix-/pug-dispenser"]

        check {
          type     = "http"
          port     = "http"
          path     = "/"
          interval = "5s"
          timeout  = "2s"
        }
      }

      resources {
        cpu = 512
        memory = 512
        network {
          port "http" { }
        }
      }
    }
  }
}
