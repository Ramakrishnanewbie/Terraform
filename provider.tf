terraform {
  backend "gcs" {
    bucket  = "terraform_state_remote-rk"
  }
}



provider "google" {
  project= local.project_id
  region = var.region
}