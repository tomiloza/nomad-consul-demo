job "hashi-ui" {
  region = "global"
  datacenters = [
    "dc1"]
  type = "service"

  group "server" {
    count = 1

    task "hashi-ui" {
      driver = "exec"

      constraint {
        attribute = "${attr.kernel.name}"
        value = "linux"
      }

      config {
        command = "hashi-ui-linux-amd64"
      }

      artifact {
        source = "https://github.com/jippi/hashi-ui/releases/download/v0.22.0/hashi-ui-linux-amd64"
      }

      service {
        name = "hashi-ui"
        port = "http"

        check {
          type = "http"
          path = "/"
          interval = "10s"
          timeout = "2s"
        }
      }

      env {
        NOMAD_ENABLE = 1
        NOMAD_ADDR = "http://127.0.0.1:4646"

        CONSUL_ENABLE = 1
      }

      resources {
        cpu = 500
        memory = 512

        network {
          mbits = 5

          port "http" {
            static = 3000
          }
        }
      }
    }
  }
}