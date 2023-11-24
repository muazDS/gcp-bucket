terraform {
  backend "gcs" {
    bucket         = "state-files-bucket-git"
    prefix         = "terraform/state"
  }
}
