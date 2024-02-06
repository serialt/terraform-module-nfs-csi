

resource "helm_release" "nfs_csi" {
  name          = var.name
  namespace     = var.namespace
  chart         = var.chart_name
  version       = var.chart_version
  repository    = var.helm_repository
  recreate_pods = true

  set {
    name  = "image.nfs.repository"
    value = "${var.storage_class.repository}/nfsplugin"
  }
  set {
    name  = "image.csiProvisioner.repository"
    value = "${var.storage_class.repository}/csi-provisioner"
  }
  set {
    name  = "image.csiSnapshotter.repository"
    value = "${var.storage_class.repository}/csi-snapshotter"
  }
  set {
    name  = "image.livenessProbe.repository"
    value = "${var.storage_class.repository}/livenessprobe"
  }
  set {
    name  = "image.nodeDriverRegistrar.repository"
    value = "${var.storage_class.repository}/csi-node-driver-registrar"
  }
  set {
    name  = "image.externalSnapshotter.repository"
    value = "${var.storage_class.repository}/snapshot-controller"
  }
  # set {
  #   name  = "imagePullSecrets"
  #   value = var.storage_class.imagePullSecrets
  # }
  set {
    name  = "controller.replicas"
    value = var.controller_replicas
  }
}

resource "kubernetes_storage_class" "nfs_csi" {
  metadata {
    name = var.storage_class.name
    annotations = var.storage_class.is_default_class ? {
      "storageclass.kubernetes.io/is-default-class" : "true"
    } : {}
  }
  storage_provisioner = "nfs.csi.k8s.io"
  reclaim_policy      = var.storage_class.reclaim_policy
  parameters          = var.storage_class.parameters
  volume_binding_mode = var.storage_class.volume_binding_mode
  depends_on          = [helm_release.nfs_csi]
}
