module "service" {
  source            = "./modules/service"
  service_name      = var.service_name
  service_namespace = var.default_namespace
  service_ports     = var.service_ports
  service_type      = var.service_type
  depends_on = [
    kubernetes_namespace.app
  ]
}
