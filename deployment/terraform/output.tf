output "app_domain" {
  value = var.domain_name.fqdn
}
output "load-balancer-hostname" {
  value = data.kubernetes_service.nginx-ingress-svc.status.0.load_balancer.0.ingress.0.hostname
}

output "aws_acm_validation" {

  value     = tolist(aws_acm_certificate.upday-cert.domain_validation_options)[0].resource_record_name
  sensitive = false
}
