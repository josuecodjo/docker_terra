# get the nginx docker image
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# start a container and expose the 30100 port
resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = var.nginx_container_name
  ports {
    internal = 80
    external = var.nginx_exposed_port
  }
}