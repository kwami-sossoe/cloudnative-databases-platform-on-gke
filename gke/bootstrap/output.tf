
output "kubectl_connection_command" {
  value       = "gcloud container clusters get-credentials ${var.cluster_prefix}-cluster --region ${var.region}"
  description = "Connection command"
}
