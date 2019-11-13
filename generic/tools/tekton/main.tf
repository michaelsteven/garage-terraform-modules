provider "null" {
}

locals {

}


resource "null_resource" "tekton_sub" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/deploy-tekton.sh"

    environment = {
      KUBECONFIG_IKS = "${var.cluster_config_file_path}"
    }
  }
}


resource "null_resource" "tekton_dashboard" {
    depends_on = ["null_resource.tekton_sub"]
  provisioner "local-exec" {
    command = "${path.module}/scripts/deploy-tekton-dashboard.sh"

    environment = {
      KUBECONFIG_IKS = "${var.cluster_config_file_path}"
    }
  }
}
