output "app_domain" {
  value = var.domain_name.fqdn
}
output "load-balancer-hostname" {
  value = data.kubernetes_service.nginx-ingress-svc.status.0.load_balancer.0.ingress.0.hostname
}
