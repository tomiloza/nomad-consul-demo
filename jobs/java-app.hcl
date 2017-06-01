job "java-app" {
  region = "global"
  datacenters = [
    "dc1"]
  type = "service"

  group "server" {
    count = 1

    task "java-app" {
      driver = "java"

      constraint {
        attribute = "${attr.kernel.name}"
        value = "linux"
      }

      config {
        jar_path = "local/java-app-1.0.jar"
        args = [
          "server"]
        jvm_options = [
          "-Xmx256m",
          "-Xms256m"]
      }

      artifact {
        source = "https://github.com/tomiloza/nomad-consul-demo/raw/master/apps/java/java-app/deploy/java-app-1.0.jar"
      }

      service {
        name = "java-app"
        port = "http"

        tags = [
          "java",
          "app"]

        check {
          type = "http"
          port = "8081"
          path = "/ping"
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