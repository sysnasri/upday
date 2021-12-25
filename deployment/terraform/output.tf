# Output values make information about your infrastructure available on the command line, 
# and can expose information for other Terraform configurations to use.
# output values are similar to return values in programming languages.

output "app_domain" {
  value       = var.domain_name.fqdn
  description = "expose application fqdn name"
}
output "load-balancer-hostname" {
  value       = data.kubernetes_service.nginx-ingress-svc.status.0.load_balancer.0.ingress.0.hostname
  description = "expose application loadbalancer hostname"
}


