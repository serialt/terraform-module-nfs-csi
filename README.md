# README
A Terraform module to install NFS-CSI

## Providers
* hashicorp/helm
* hashicorp/kubernete

## Resources
* helm_release.nfs_csi
* kubernetes_storage_class.nfs_csi

## Inputs

* helm_repository
* chart_version
* chart_name
* name
* namespace
* mirror
* imagePullSecrets
* storage_class
* controller_replicas


## Outputs
* name
* namespace
* release_name
* chart_version
* app_version
* storage_class_name
* nfs_csi_server
