module "gke_cluster" {
  source                        = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version = "~> 31.1.0"#29.0"
  project_id                    = var.project_id
  name                          = "${var.cluster_prefix}-cluster"
  regional                      = true
  region                        = var.region
  network                       = var.network
  subnetwork                    = var.subnetwork
  ip_range_pods                 = "k8s-pod-range"
  ip_range_services             = "k8s-service-range"
  create_service_account        = true
  grant_registry_access         = true
  enable_private_endpoint       = false
  enable_private_nodes          = true
  master_ipv4_cidr_block        = "172.16.0.0/28"
  network_policy                = true
  logging_enabled_components    = ["SYSTEM_COMPONENTS","WORKLOADS"]
  monitoring_enabled_components = ["SYSTEM_COMPONENTS"]
  enable_cost_allocation        = true
  deletion_protection           = false
  initial_node_count            = 0 # 1

  # http_load_balancing        = false
  horizontal_pod_autoscaling = true
  # filestore_csi_driver       = false
  # dns_cache                  = false

  ### enable_cilium_clusterwide_network_policy  = true
  #datapath_provider             = "ADVANCED_DATAPATH" # "LEGACY_DATAPATH"



  cluster_resource_labels = {
    name      = "${var.cluster_prefix}-cluster"
    component = "cloud_native_db"
  }

  monitoring_enable_managed_prometheus = true
 
  node_pools        = var.node_pools
  node_pools_labels = var.node_pools_labels
  node_pools_taints = var.node_pools_taints
  gce_pd_csi_driver = true

  # node_pools_oauth_scopes = {
  #   all = [
  #     "https://www.googleapis.com/auth/logging.write",
  #     "https://www.googleapis.com/auth/monitoring",
  #   ]
  # }

}

/*

datapath_provider - (Optional) The desired datapath provider for this cluster. 
This is set to LEGACY_DATAPATH by default, which uses the IPTables-based kube-proxy implementation. 
Set to ADVANCED_DATAPATH to enable Dataplane v2.

*/