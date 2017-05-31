job "python-app" {
  region = "global"
  datacenters = [
    "dc1"]
  type = "service"

  group "server" {
    count = 1

    task "python-app" {
      driver = "exec"

      constraint {
        attribute = "${attr.kernel.name}"
        value = "linux"
      }

      config {
        command = "install_run.sh"
      }

      artifact {
        source = "https://github.com/tomiloza/nomad-consul-demo/raw/master/apps/python/app.tgz"
      }

      service {
        port = "http"

        check {
          type = "http"
          path = "/"
          interval = "10s"
          timeout = "2s"
        }
      }

      resources {
        cpu = 500
        memory = 256

        network {
          mbits = 5

          port "http" {
            static = 8080
          }
        }
      }
    }
  }
}