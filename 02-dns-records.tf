data "digitalocean_domain" "this" {
  name = "interactiver.online"
}

resource "digitalocean_record" "monitoring-dns-record" {
  domain = data.digitalocean_domain.this.id
  type   = "A"
  name   = "monitoring-test"
  value  = digitalocean_droplet.monitoring.ipv4_address

  depends_on = [ digitalocean_droplet.monitoring ]
}