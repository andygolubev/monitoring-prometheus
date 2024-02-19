resource "ansible_playbook" "playbook" {
  playbook   = "playbook-monitoring-setup.yml"
  name       = digitalocean_droplet.monitoring.ipv4_address
  replayable = true
  verbosity  = 3
  depends_on = [ null_resource.addkey ]
}
