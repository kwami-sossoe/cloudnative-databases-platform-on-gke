# General variables 
variable "project_id" {
  description = "The project ID to host the cluster in"
  default     = ""
  type        = string
}

variable "region" {
  description = "The region to host the cluster in"
  type        = string
}

variable "region_west_4" {
  description = "The region to host the cluster in"
  type        = string
}

variable "cluster_prefix" {
  description = "The prefix for all cluster resources"
  default     = "cloud-native-db"
  type        = string
}

variable "env" {
  description = "Environnement"
  type        = string
}


# Commun variables
variable "standard_disk_type" {
  description = "Standard Disk Type"
  type        = string
}

variable "balanced_disk_type" {
  description = "Balanced Disk Type"
  type        = string
}

variable "c_optimized_machine_type" {
  description = "C Optimized Machine Type"
  type        = string
}

variable "node_pool_autoscaling" {
  description = "Node Pool Autoscaling"
  type        = bool
}

variable "node_pool_node_auto_repair" {
  description = "Auto Repair on Node Pool"
  type        = bool
}

variable "node_max_unavailable" {
  description = "Node Max Unavailable"
  type        = number
}

variable "node_max_surge" {
  description = "Node Max Surge"
  type        = number
}


# Main Node Pool
variable "pool_main_name" {
  description = "Name of Main Node Pool "
  type        = string
}

variable "main_disk_size_gb" {
  description = "Disk Size in GB of Node of Main Node Pool "
  type        = string
}

variable "main_machine_type" {
  description = "Machine Type of Node of Main Node Pool "
  type        = string
}

variable "main_max_count" {
  description = "Maximum of Nodes for Main Node Pool"
  type        = number
}

variable "main_min_count" {
  description = "Minimum of Nodes for Main Node Pool"
  type        = number
}


# Postgres Node Pool
variable "pool_pg_name" {
  description = "Name of Postgres Node Pool "
  type        = string
}

variable "pg_disk_size_gb" {
  description = "Disk Size in GB of Node of Postgres Node Pool "
  type        = string
}

variable "pg_machine_type" {
  description = "Machine Type of Node of Postgres Node Pool "
  type        = string
}

variable "pg_max_count" {
  description = "Maximum of Nodes for Postgres Node Pool"
  type        = number
}

variable "pg_min_count" {
  description = "Minimum of Nodes for Postgres Node Pool"
  type        = number
}


# GraphDB Node Pool
variable "pool_graphdb_name" {
  description = "Name of GraphDB Node Pool "
  type        = string
}

variable "graphdb_disk_size_gb" {
  description = "Disk Size in GB of Node of GraphDB Node Pool "
  type        = string
}

variable "graphdb_machine_type" {
  description = "Machine Type of Node of GraphDB Node Pool "
  type        = string
}

variable "graphdb_max_count" {
  description = "Maximum of Nodes for GraphDB Node Pool"
  type        = number
}

variable "graphdb_min_count" {
  description = "Minimum of Nodes for GraphDB Node Pool"
  type        = number
}


# MongoDB Node Pool
variable "pool_mongodb_name" {
  description = "Name of MongoDB Node Pool "
  type        = string
}

variable "mongodb_disk_size_gb" {
  description = "Disk Size in GB of Node of MongoDB Node Pool "
  type        = string
}

variable "mongodb_machine_type" {
  description = "Machine Type of Node of MongoDB Node Pool "
  type        = string
}

variable "mongodb_max_count" {
  description = "Maximum of Nodes for MongoDB Node Pool"
  type        = number
}

variable "mongodb_min_count" {
  description = "Minimum of Nodes for MongoDB Node Pool"
  type        = number
}
