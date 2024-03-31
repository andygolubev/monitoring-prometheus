# Create a new SSH key
resource "digitalocean_ssh_key" "devopsvm" {
  name       = "DevOps ssh"
  public_key = file("../.ssh/id_ed25519.pub")
}

# Create a new Droplet using the SSH key
resource "digitalocean_droplet" "monitoring" {
  image  = "ubuntu-23-10-x64"
  name   = "monitoring_vault"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  #size   = "s-1vcpu-2gb"
  ssh_keys = [digitalocean_ssh_key.devopsvm.fingerprint]

  provisioner "local-exec" {
    command = "echo ${digitalocean_droplet.monitoring.ipv4_address} > ./playbook_inventory"
  }

}