################################################
#  Creates a CNAME Record in OVH
################################################
provider "ovh" {
  endpoint           = "ovh-eu"
  application_key    = var.application_key
  application_secret = var.application_secret
  consumer_key       = var.consumer_key

}
# Provides a OVH domain zone record.

resource "ovh_domain_zone_record" "upday_cname_record" {
  zone      = lookup(var.domain_name, "zone")
  subdomain = lookup(var.domain_name, "subdomain")
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = "${data.kubernetes_service.nginx-ingress-svc.status.0.load_balancer.0.ingress.0.hostname}."
  depends_on = [
    helm_release.upday
  ]

}

# Provides a OVH domain zone record for TLS record

resource "ovh_domain_zone_record" "upday_tls_record" {
  zone      = lookup(var.domain_name, "zone")
  subdomain = tolist(aws_acm_certificate.upday-cert.domain_validation_options)[0].resource_record_name
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = tolist(aws_acm_certificate.upday-cert.domain_validation_options)[0].resource_record_value


}
