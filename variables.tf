variable "helm_repository" {
  type    = string
  default = "https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/master/charts"
}

variable "chart_version" {
  type    = string
  default = "v4.5.0"
}

variable "chart_name" {
  type    = string
  default = "csi-driver-nfs"

}

variable "name" {
  type    = string
  default = "csi-driver-nfs"
}

variable "namespace" {
  type    = string
  default = ""
}

# variable "nfs_csi_values" {
#   type    = any
#   default = {}
# }

variable "storage_class" {
  type = any
  default = {
    name             = "nfs-csi-sc"
    is_default_class = false
    repository       = "registry.k8s.io/sig-storage"
    imagePullSecrets = []
    parameters = {
      server = ""
      share  = "/"
    }
    reclaim_policy      = "Retain"
    volume_binding_mode = "Immediate"
    mountOptions        = ["nfsvers=4.1"]
  }

}

