output "bq_output"{
  value = google_service_account.bqowner.email
  sensitive=true
}

output "bq_dataset_id"{
  value = google_bigquery_dataset.dataset.dataset_id
}