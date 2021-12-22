variable "service_name" {
  type        = string
  description = "(Required) Application name for attach to service"
}
variable "service_namespace" {
  type        = string
  description = "(Required) Namespace where located application"
}
variable "service_ports" {
  description = "(Required) Mapping ports from container to expose port"
}
variable "service_type" {
  type        = string
  default     = "ClusterIP"
  description = "(Optional) Default is ClusterIP. Can accept: NodePort , LoadBalancer ."
}
variable "load_balancer_ip" {
  type        = string
  description = "(Optional) !!!Only applies with type = LoadBalancer!!! Define External Static IP address."
  default     = null
}
variable "load_balancer_ips_whitelist" {
  type        = list(string)
  default     = null
  description = "(Optional) !!!Only applies with type = LoadBalancer!!! Define IPs cidr range for whitelist in Load Balancer. By default accept all IPs."
}
variable "annotations" {
  description = "(Optional) Add annotations"
  default     = {}
}
locals {
  labels = var.custom_labels == null ? { app = var.app_name } : var.custom_labels
}
variable "custom_labels" {
  description = "(Optional) Custom labels & selector"
  default     = null
}
