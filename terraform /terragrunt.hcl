terraform {
  source = "./" 
}

inputs = {
  kuber_folder = "../kuber" 
}

inputs = {
  bucket_name    = "${var.name}-${var.environment}"
  bucket_location = "--"
  environment    = "dev"
  project_id     = "-----------"
}
