terraform {
  backend "gcs" {
    bucket         = "state-files-bucket-git"
    prefix         = "terraform/state"
    credentials    = var.gcp_credentials_path
    project        = var.gcp_project_id
    region         = var.gcp_region
  }
}
