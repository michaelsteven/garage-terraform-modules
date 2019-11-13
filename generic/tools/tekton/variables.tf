
# Cluster Variables
variable "cluster_type" {
  type        = "string"
  description = "The type of cluster that should be created (openshift or kubernetes)"
}

variable "cluster_config_file_path" {
  type        = "string"
  description = "The path to the config file for the cluster"
}