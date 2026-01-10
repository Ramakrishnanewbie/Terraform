resource "google_service_account" "terraform-practice-service-account" {
  account_id   = "terraform-practice"
  display_name = "Service account to practice terraform provisioning"
}

resource "google_service_account" "bqowner" {
  account_id = "bqowner"
}

resource "google_service_account" "bqowner_test" {
  account_id = "bqowner_test"
}


resource "google_service_account" "analytics_hub" {
  account_id = "analytics_hub"
}