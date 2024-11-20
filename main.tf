terraform {
  cloud {
    organization = "lockermanwxlf"
    workspaces {
      name = "DigitalOceanTest"
    }
  }
  required_providers {
    digitalocean = {
        source = "digitalocean/digitalocean"
    }
  }
}

provider "digitalocean" {
  token = var.digitalocean_access_token
}

resource "digitalocean_droplet" "vps" {
  name = "vps"
  size = "s-1vcpu-1gb-35gb-intel"
  image = "ubuntu-24-04-x64"
  
}

resource "digitalocean_project" "project" {
    name = "TerraformTest"
    resources = [digitalocean_droplet.vps.urn]
}