resource "digitalocean_droplet" "web" {
  count = var.droplet_count
  image  = var.droplet_image
  name   = "web-${count.index + 1}"
  region = var.droplet_region
  size   = var.droplet_size
}

resource "digitalocean_loadbalancer" "web-loadbalancer" {
  name = "web-loadbalancer-1"
  region = var.droplet_region
  size = var.loadbalancer_size

  forwarding_rule {
    entry_port = 443
    entry_protocol = "https"

    target_port = 443
    target_protocol = "https"
    
    tls_passthrough = true
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = digitalocean_droplet.web.*.id
}
