resource "kubernetes_service" "service" {
  metadata {
    name        = var.service_name
    namespace   = var.service_namespace
    annotations = var.annotations
    labels      = local.labels
  }
  spec {
    selector                    = local.labels
    type                        = var.service_type
    load_balancer_ip            = var.service_type == "LoadBalancer" ? var.load_balancer_ip : null
    load_balancer_source_ranges = var.service_type == "LoadBalancer" ? var.load_balancer_ips_whitelist : null
    dynamic "port" {
      iterator = port
      for_each = var.service_ports
      content {
        name        = port.value.name
        port        = port.value.external_port
        protocol    = lookup(port.value, "protocol", "TCP")
        node_port   = lookup(port.value, "node_port", null)
        target_port = port.value.internal_port
      }
    }
  }
}
