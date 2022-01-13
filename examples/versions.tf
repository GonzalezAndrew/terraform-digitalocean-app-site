terraform {
  required_version = ">= 0.15.1, < 1.1.4"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.4.0"
    }
  }
}
