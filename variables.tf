variable "do_token" {
  type = string
  description = "Digital ocean access token"
  sensitive = true
}

variable "droplet_count" {
  type = number
  description = "Number of droplets to create"
  default = 1
}

variable "droplet_image" {
  type = string
  description = "The droplet image ID or slug"
  default = "ubuntu-22-04-x64"
}

variable "droplet_region" {
  type = string 
  description = "The region where a droplet will be created"
  default = "fra1"
}

variable "droplet_size" {
  type = string 
  description = "The unique slug that indentifies the type of a droplet"
  default = "s-1vcpu-1gb"
}
