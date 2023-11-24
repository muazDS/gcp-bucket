terraform {
  backend "gcs" {
    bucket         = "state-files-bucket-git"
    prefix         = "terraform/state"
    credentials    = "./neural-water-404520-2b5b17d0cb26.json"
    project        = "neural-water-404520"
    region         = "us"
  }
}
