provider "google" {
  credentials = var.gcp_credentials_path
}

terraform {
  backend "gcs" {
    bucket         = "state-files-bucket-git"
    prefix         = "terraform/state"
    credentials    = var.gcp_credentials_path
    project        = var.gcp_project_id
    region         = var.gcp_region
  }
}

resource "google_storage_bucket" "static_website_bucket" {
  name          = var.storage_bucket_name
  location      = var.gcp_region
  force_destroy = true
}

resource "google_compute_backend_bucket" "cdn_backend_bucket" {
  name        = var.storage_bucket_name
  bucket_name = google_storage_bucket.static_website_bucket.name
  enable_cdn  = true
}

resource "google_compute_url_map" "cdn_url_map" {
  name            = "cdn-url-map"
  default_service = google_compute_backend_bucket.cdn_backend_bucket.self_link
}

resource "google_compute_target_http_proxy" "cdn_http_proxy" {
  name    = "cdn-http-proxy"
  url_map = google_compute_url_map.cdn_url_map.self_link
}

resource "google_compute_global_forwarding_rule" "cdn_forwarding_rule" {
  name       = "cdn-forwarding-rule"
  target     = google_compute_target_http_proxy.cdn_http_proxy.self_link
  port_range = "80"
}
