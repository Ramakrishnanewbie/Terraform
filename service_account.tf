resource "google_service_account" "terraform-practice-service-account" {
  account_id   = "terraform-practice"
  display_name = "Service account to practice terraform provisioning"
}

resource "google_service_account" "bqowner" {
  account_id = "bqowner"
}