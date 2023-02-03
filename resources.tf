resource "digitalocean_droplet" "web" {
  count = var.droplet_count
  image  = var.droplet_image
  name   = "web-${count.index + 1}"
  region = var.droplet_region
  size   = var.droplet_size
}
