# resource "ansible_playbook" "playbook" {
#   playbook   = "playbook-monitoring-setup.yml"
#   name       = digitalocean_droplet.monitoring.ipv4_address
#   replayable = true
#   verbosity  = 3
#   depends_on = [ null_resource.addkey ]
# }


resource "null_resource" "make_inventory" {
  provisioner "local-exec" {
    command = "echo ${digitalocean_droplet.monitoring.ipv4_address} > ./inventory.ini"
  }

  depends_on = [ digitalocean_droplet.monitoring ]
}

resource "null_resource" "run_playbook" {
  provisioner "local-exec" {
    command = "ansible-playbook -i ./inventory.ini ./playbook-monitoring-setup.yml --ssh-extra-args='-o StrictHostKeyChecking=no'"
  }
  triggers = {
    timestamp = timestamp()
  }

  depends_on = [ null_resource.make_inventory ]
}

