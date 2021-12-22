module "deployment" {
  source        = "./modules/deployment"
  name          = var.app_name
  namespace     = var.default_namespace
  image         = var.image
  internal_port = var.containerport
  depends_on = [
    kubernetes_namespace.app
  ]
}
