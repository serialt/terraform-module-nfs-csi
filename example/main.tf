module "nfs_csi" {
  source = "../"

  namespace = "dev"
  storage_class = {
    name             = "nfs-csi-sc"
    is_default_class = false
    parameters = {
      server = "192.168.10.100"
      share  = "/data/nfs"
    }
    reclaim_policy      = "Retain"
    volume_binding_mode = "Immediate"
    mountOptions        = ["nfsvers=4.1"]

  }
  mirror = "docker.io/serialt"
}


resource "kubernetes_persistent_volume_claim" "nfs" {
  metadata {
    name = "pvc-nfs-dynamic"
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    storage_class_name = module.nfs_csi.storage_class_name
  }

}
