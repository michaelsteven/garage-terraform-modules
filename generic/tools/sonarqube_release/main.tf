provider "null" {
}

locals {
  tmp_dir                = "${path.cwd}/.tmp"
  ingress_host           = "sonarqube.${var.cluster_ingress_hostname}"
  ingress_url            = "http://${local.ingress_host}"
  secret_name            = "sonarqube-access"
  config_name            = "sonarqube-config"
  values_file_default    = "${path.module}/sonarqube-values.yaml"
  values_file_openshift  = "${path.module}/sonarqube-values-openshift.yaml"
  values_file            = "${var.cluster_type == "openshift" ? local.values_file_openshift : local.values_file_default}" 
  kustomize_template     = "${path.module}/kustomize/sonarqube"
  volume_capacity        = "${var.volume_capacity}"
}

resource "null_resource" "sonarqube_release" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/deploy-sonarqube.sh ${var.releases_namespace} ${local.ingress_host} ${var.helm_version} ${var.service_account_name} ${var.volume_capacity} \"${jsonencode(var.plugins)}\""

    environment = {
      KUBECONFIG_IKS    = "${var.cluster_config_file}"
      TMP_DIR           = "${local.tmp_dir}"
      TLS_SECRET_NAME   = "${var.tls_secret_name}"
      DATABASE_HOST     = "${var.postgresql_hostname}"
      DATABASE_PORT     = "${var.postgresql_port}"
      DATABASE_NAME     = "${var.postgresql_database_name}"
      DATABASE_USERNAME = "${var.postgresql_username}"
      DATABASE_PASSWORD = "${var.postgresql_password}"
    }
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "${path.module}/scripts/destroy-sonarqube.sh ${var.releases_namespace}"

    environment = {
      KUBECONFIG_IKS = "${var.cluster_config_file}"
    }
  }
}
