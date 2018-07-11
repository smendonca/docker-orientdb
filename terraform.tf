provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_container" "orientdb" {
  image = "${docker_image.orientdb.latest}"
  name  = "node-orientdb"
}

resource "docker_image" "orientdb" {
  name = "smendonca/orientdb:latest"
}
