
module "bucket" {
  source = "./modules/cloud-storage"
}
module "gke_cluster" {
  source         = "./modules/gke-cluster-module"  
  project_id     = "------------"
  region         = "europe-central2"
  cluster_name   = "my-gke-cluster"
  node_count     = 1
  machine_type   = "n1-standard-1"
  network        = "default"
  subnetwork     = "default"


  enable_autoscaling = false
  min_node_count     = 1
  max_node_count     = 1
  enable_network_policy = true
  enable_private_nodes = false
  master_ipv4_cidr_block = "172.16.0.0/28"
  
}

module "kubernetes" {
  source = "./modules/kubernetes"
  kuber_folder = "../kuber"
}

