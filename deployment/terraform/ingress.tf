module "ingress" {
  source            = "./modules/ingress"
  service_name      = var.service_name
  service_namespace = var.default_namespace
  rule = [
    {
      domain        = lookup(var.domain_name, "fqdn")
      external_port = var.service_ports[0].external_port
    }
  ]
  depends_on = [
    kubernetes_namespace.app
  ]

}

