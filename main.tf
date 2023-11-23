provider "google" {
  credentials = file(var.credentials_path)
  project     = var.project_id
  region      = var.region
}

variable "credentials_path" {
  description = "Path to the GCP service account credentials file"
}

variable "project_id" {
  description = "Google Cloud Platform Project ID"
}

variable "region" {
  description = "GCP region for the resources"
}

variable "bucket_name" {
  description = "Name for the Google Cloud Storage bucket"
}

resource "google_storage_bucket" "example_bucket" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true
}
