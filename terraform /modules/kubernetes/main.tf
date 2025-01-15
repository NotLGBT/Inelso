variable "kuber_folder" {
  description = "Kubernetes manifests folder"
}

resource "kubernetes_manifest" "django_deployment" {
  manifest = yamldecode(file("${var.kuber_folder}/deployment/django-deployment.yaml"))
}

resource "kubernetes_manifest" "postgres_deployment" {
  manifest = yamldecode(file("${var.kuber_folder}/deployment/postgres-deployment.yaml"))
}

resource "kubernetes_manifest" "rabbitmq_deployment" {
  manifest = yamldecode(file("${var.kuber_folder}/deployment/rabbitmq-deployment.yaml"))
}

resource "kubernetes_manifest" "configmap" {
  manifest = yamldecode(file("${var.kuber_folder}/configmap/configmap.yaml"))
}

resource "kubernetes_manifest" "secret" {
  manifest = yamldecode(file("${var.kuber_folder}/secret/secret.yaml"))
}
