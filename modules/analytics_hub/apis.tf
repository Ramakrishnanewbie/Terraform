resource "google_project_service" "analytics_hub_api" {
  project            = var.project_id
  service            = "analyticshub.googleapis.com"
  disable_on_destroy = false
}   

