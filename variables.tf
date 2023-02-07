variable "digitalocean_access_token" {
  type = string
  description = "DigitalOcean access token"
}

variable "digitalocean_ssh_key_file_path" {
  type = string
  description = "Path to key to export into DigitalOcean for SSH access."
}

variable "digitalocean_ssh_some_pubkey_body" {
  type = string
  description = "Some SSH public key body."
}

variable "email_tag" {
  type = string
  description = "Email of a current user in a tag format"
}