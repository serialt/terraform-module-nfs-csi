output "name" {
  value = var.name
}

output "namespace" {
  value = helm_release.nfs_csi.metadata[0].namespace
}

output "release_name" {
  value = helm_release.nfs_csi.metadata[0].name
}

output "chart_version" {
  value = helm_release.nfs_csi.metadata[0].version
}

output "app_version" {
  value = helm_release.nfs_csi.metadata[0].app_version
}

output "storage_class_name" {
  value = kubernetes_storage_class.nfs_csi.metadata[0].name

}

output "nfs_csi_server" {
  value = {
    server = kubernetes_storage_class.nfs_csi.parameters.server
    share  = kubernetes_storage_class.nfs_csi.parameters.share
  }

}
