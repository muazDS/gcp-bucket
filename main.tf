provider "google" {
  credentials = file(var.credentials_path)
  project     = var.project_id
  region      = var.region
}

resource "google_storage_bucket" "example_bucket" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true
}
