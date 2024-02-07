data "external" "key_data" {
  program = ["/bin/bash", "${path.module}/scripts/get_key_data.sh"]

  query = {
    do_token = var.digitalocean_access_token
    key_body = var.digitalocean_ssh_some_pubkey_body
  }
}

data "digitalocean_sizes" "main" {
  filter {
    key    = "vcpus"
    values = [1]
  }

  filter {
    key    = "memory"
    values = [1024]
  }

  filter {
    key    = "disk"
    values = [25]
  }

  sort {
    key       = "price_monthly"
    direction = "asc"
  }
}

data "digitalocean_regions" "available" {
  filter {
    key    = "available"
    values = ["true"]
  }
}
