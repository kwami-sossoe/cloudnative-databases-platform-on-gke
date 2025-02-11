# Create Private Subnet
module "network" {
  source         = "../modules/network"
  project_id     = var.project_id
  region         = var.region
  cluster_prefix = "${var.cluster_prefix}-${var.env}"
}

# Create GKE Cluster
module "gke" {
  source         = "../modules/cluster"
  project_id     = var.project_id
  region         = var.region
  cluster_prefix = "${var.cluster_prefix}-${var.env}"
  network        = module.network.network_name
  subnetwork     = module.network.subnet_name

  # initial_node_count            = 1
  # http_load_balancing        = false
  # network_policy             = false
  # horizontal_pod_autoscaling = true
  # filestore_csi_driver       = false
  # dns_cache                  = false 

  node_pools = [
    # Main Node Pool
    {
      name            = var.pool_main_name
      disk_size_gb    = var.main_disk_size_gb
      min_count       = var.main_min_count
      max_count       = var.main_max_count
      machine_type    = var.main_machine_type
      disk_type       = var.standard_disk_type
      autoscaling     = var.node_pool_autoscaling
      max_surge       = var.node_max_surge
      max_unavailable = var.node_max_unavailable
      auto_repair     = var.node_pool_node_auto_repair
    },
    # # Postgres Node Pool
    # {
    #   name            = var.pool_pg_name
    #   disk_size_gb    = var.pg_disk_size_gb
    #   min_count       = var.pg_min_count
    #   max_count       = var.pg_max_count
    #   machine_type    = var.pg_machine_type
    #   disk_type       = var.standard_disk_type
    #   autoscaling     = var.node_pool_autoscaling
    #   max_surge       = var.node_max_surge
    #   max_unavailable = var.node_max_unavailable
    #   auto_repair     = var.node_pool_node_auto_repair
    # },
    # # GraphDB Node Pool
    # {
    #   name            = var.pool_graphdb_name
    #   disk_size_gb    = var.graphdb_disk_size_gb
    #   min_count       = var.graphdb_min_count
    #   max_count       = var.graphdb_max_count
    #   machine_type    = var.graphdb_machine_type
    #   disk_type       = var.standard_disk_type
    #   autoscaling     = var.node_pool_autoscaling
    #   max_surge       = var.node_max_surge
    #   max_unavailable = var.node_max_unavailable
    #   auto_repair     = var.node_pool_node_auto_repair
    # },
    # # MongoDB Node Pool
    # {
    #   name            = var.pool_mongodb_name
    #   disk_size_gb    = var.mongodb_disk_size_gb
    #   min_count       = var.mongodb_min_count
    #   max_count       = var.mongodb_max_count
    #   machine_type    = var.mongodb_machine_type
    #   disk_type       = var.standard_disk_type
    #   autoscaling     = var.node_pool_autoscaling
    #   max_surge       = var.node_max_surge
    #   max_unavailable = var.node_max_unavailable
    #   auto_repair     = var.node_pool_node_auto_repair
    # },
  ]

  node_pools_labels = {
    all = {}
    # pool-postgresql = {
    #   "app.component" = "pg-cluster"
    # }
    # pool-graphdb = {
    #   "app.component" = "graphdb-cluster"
    # }
    # pool-mongodb = {
    #   "app.component" = "mongodb-cluster"
    # }
  }

  node_pools_taints = {
    all = []
    # pool-postgresql = [
    #   {
    #     key    = "cnpg.io/cluster"
    #     value  = "gke-pg-cluster"
    #     effect = "NO_SCHEDULE"
    #   }
    # ]
    pool-graphdb = [
      {
        key    = "ontotext.com"
        value  = "gke-graphdb-cluster"
        effect = "NO_SCHEDULE"
      }
    ]
    pool-mongodb = [
      {
        key    = "mongodb.com"
        value  = "gke-mongodb-cluster"
        effect = "NO_SCHEDULE"
      }
    ]
  }

}
