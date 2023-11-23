
variable "gcp_credentials_path" {
  description = "Path to the Google Cloud service account credentials file"
  default = "/home/muazlinux/Downloads/neural-water-404520-2b5b17d0cb26.json"
}

variable "gcp_project_id" {
  description = "Google Cloud Project ID"
  default = "neural-water-404520"
}

variable "gcp_region" {
  description = "Google Cloud region for the resources"
  default = "us"
}

variable "storage_bucket_name" {
  description = "Name for the Google Cloud Storage bucket"
  default = "asg121dou"
}
