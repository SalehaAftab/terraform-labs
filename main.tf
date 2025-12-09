terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_server" {
  image = docker_image.nginx.image_id
  name  = "nginx_server"

  ports {
    internal = 80
    external = 8083
  }
}
