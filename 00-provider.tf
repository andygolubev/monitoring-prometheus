terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    ansible = {
      version = "~> 1.1.0"
      source  = "ansible/ansible"
    }
  }

  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "https://fra1.digitaloceanspaces.com"
    region                      = "us-east-1" // needed for this section, don't touch
    key                         = "infrastructure/monitoring-v1/terraform-monitoring.tfstate"

    # USE THIS FOR THE MAIN DIGITAL OCEAN ACCOUNT
    bucket = "terraform-state-interactiver-main"
  }
}


# Configure the DigitalOcean Provider
variable "digital_ocean_api_token" {
  description = "Digital Ocean token"
  type        = string
}
provider "digitalocean" {
  token = var.digital_ocean_api_token
}