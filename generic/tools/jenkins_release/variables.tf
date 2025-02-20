variable "cluster_config_file" {
  type        = "string"
  description = "Cluster config file for Kubernetes cluster."
}

variable "releases_namespace" {
  type        = "string"
  description = "Name of the existing namespace where the Helm Releases will be deployed."
}

variable "cluster_ingress_hostname" {
  type        = "string"
  description = "Ingress hostname of the IKS cluster."
}

variable "cluster_type" {
  description = "The cluster type (openshift or kubernetes)"
}

variable "tls_secret_name" {
  description = "The secret containing the tls certificates"
  default = ""
}

variable "volume_capacity" {
  description = "The volume capacity of the persistence volume claim"
  default     = "2Gi"
}

variable "storage_class" {
  description = "The storage class of the persistence volume claim"
  default     = "ibmc-file-gold"
}

variable "helm_version" {
  description = "The version of helm chart that should be deployed"
  default     = "1.7.9"
}
