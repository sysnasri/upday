################################################
#  Creating a CNAME Record in OVH
################################################
provider "ovh" {
  endpoint           = "ovh-eu"
  application_key    = var.application_key
  application_secret = var.application_secret
  consumer_key       = var.consumer_key

}

resource "ovh_domain_zone_record" "upday_cname_record" {
  zone      = lookup(var.domain_name, "zone")
  subdomain = lookup(var.domain_name, "subdomain")
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = "${data.kubernetes_service.nginx-ingress-svc.status.0.load_balancer.0.ingress.0.hostname}."
  depends_on = [
    module.ingress
  ]

}
