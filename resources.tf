resource "digitalocean_ssh_key" "my_ssh_key" {
  name       = "hopetoknow"
  public_key = file(var.digitalocean_ssh_key_file_path)
}

resource "digitalocean_tag" "email" {
  name = var.email_tag
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-22-04-x64"
  name   = "web-1"
  region = element(data.digitalocean_regions.available.regions, 0).slug
  size   = element(data.digitalocean_sizes.main.sizes, 0).slug
  ssh_keys = [data.external.key_data.result.id, digitalocean_ssh_key.my_ssh_key.id]
  tags   = ["devops", var.email_tag]
}
