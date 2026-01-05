resource "google_storage_bucket" "terraform_state"{
  name ="terraform_state_remote-rk"
  location = var.region
}