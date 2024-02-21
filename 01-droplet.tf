# Create a new SSH key
resource "digitalocean_ssh_key" "vagrantvm" {
  name       = "Vagrant ssh"
  public_key = file("../.ssh/id_ed25519.pub")
}

# Create a new Droplet using the SSH key
resource "digitalocean_droplet" "monitoring" {
  image  = "ubuntu-23-10-x64"
  name   = "monitoring"
  region = "fra1"
  #size   = "s-1vcpu-1gb-35gb-intel"
  size   = "s-2vcpu-2gb"
  ssh_keys = [digitalocean_ssh_key.vagrantvm.fingerprint]

  provisioner "local-exec" {
    command = "echo ${digitalocean_droplet.monitoring.ipv4_address} > ./inventory.ini"
  }

}

# resource "null_resource" "addkey" {
#   provisioner "local-exec" {
#     command = "echo $(ssh-keyscan -H ${digitalocean_droplet.monitoring.ipv4_address}) >> ~/.ssh/known_hosts"
#   }

#   depends_on = [ digitalocean_droplet.monitoring ]
# }