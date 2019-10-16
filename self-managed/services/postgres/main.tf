locals {
  namespaces      = ["${var.tools_namespace}", "${var.dev_namespace}", "${var.test_namespace}", "${var.staging_namespace}"]
  namespace_count = 0
  tmp_dir          = "${path.cwd}/.tmp"
  storage_class         = "ibmc-file-gold"
  volume_capacity       = "5Gi"
}

resource "null_resource" "postgresql_release" {
  count = "${var.cluster_type == "openshift" ? "1" : "0"}"
  
  provisioner "local-exec" {
    command = "${path.module}/scripts/deploy-postgres_openshift.sh ${var.tools_namespace} ${local.storage_class} ${local.volume_capacity}"
    environment = {
      TMP_DIR        = "${local.tmp_dir}"
    }
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "${path.module}/scripts/destroy-postgres.sh ${var.tools_namespace}"
  }
}

