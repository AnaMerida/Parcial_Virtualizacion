# Specifying Docker provider

terraform {

  required_providers {

    docker = {

      source  = "kreuzwerker/docker"

      version = "2.23.1"

    }

  }

}

# Define the Docker container data source

data "docker_image" "local_image" {

  name = "tercer-parcial"

}

# Define the Docker container resource

resource "docker_container" "pure_app" {

  name  = "tercer-parcial"

  image = data.docker_image.local_image.name

  # Expose port 8000 for Flask app

  ports {

    internal = 8000

    external = 8000

  }
}


data "docker_image" "mongodb_image" {
  name = "mongodb/mongodb-community-server:latest"
}

# Define the Docker container resource for the MongoDB database
resource "docker_container" "mongodb_db" {
  name  = "mongodb_db"
  image = data.docker_image.mongodb_image.name

  # Expose port 27017 for MongoDB
  ports {
    internal = 27017
    external = 27017
  }
}

data "docker_image" "wordpress_image" {
  name = "wordpress:latest"
}

resource "docker_container" "wordpress_container" {
  name  = "wordpress"
  image = data.docker_image.wordpress_image.name

  # Expose port 80 for WordPress
  ports {
    internal = 80
    external = 1234
  }
}

data "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  name  = "nginx"
  image = data.docker_image.nginx_image.name

  # Expose ports for Nginx
  ports {
    internal = 80
    external = 4567
  }
}

