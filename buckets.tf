resource "google_storage_bucket" "terraform_state"{
  name ="terraform_state_remote-rk"
  location = var.region
}


resource "google_storage_bucket" "test_bucket"{
  name ="test"
  location = var.region
}