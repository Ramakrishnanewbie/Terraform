# Terraform
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/Ramakrishnanewbie/Terraform)

This repository provides a foundational Terraform configuration for provisioning resources on Google Cloud Platform (GCP). It serves as a practical example of Infrastructure as Code (IaC) principles, demonstrating how to manage cloud infrastructure declaratively.

## Resources Created

This Terraform configuration will create the following resources in your GCP project:

*   **`google_storage_bucket`**: A GCS bucket (`terraform_state_remote-rk`) is created to store the Terraform remote state.
*   **`google_bigquery_dataset`**: Two separate BigQuery datasets (`example_dataset` and `example_dataset_2`) are provisioned.
*   **`google_service_account`**: Two service accounts (`terraform-practice` and `bqowner`) are created. The `bqowner` account is assigned ownership of the BigQuery datasets.

## Prerequisites

Before you begin, ensure you have the following installed and configured:

*   [Terraform](https://www.terraform.io/downloads.html)
*   [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
*   A Google Cloud project with the necessary APIs enabled (e.g., BigQuery API, Cloud Storage API, IAM API).
*   Authentication to your GCP account. You can authenticate the gcloud CLI by running:
    ```sh
    gcloud auth application-default login
    ```

## Setup and Usage

Follow these steps to deploy the infrastructure.

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/ramakrishnanewbie/terraform.git
    cd terraform
    ```

2.  **Configure Project ID:**
    Update the `project_id` in `locals.tf` to your own Google Cloud project ID.
    ```hcl
    // locals.tf
    locals {
      project_id = "your-gcp-project-id"
    }
    ```

3.  **Configure Variables:**
    Create a file named `terraform.tfvars` and add your desired GCP region.
    ```tfvars
    // terraform.tfvars
    region = "us-central1"
    ```

4.  **Initialize Terraform:**
    This command initializes the backend, downloads the Google provider plugin, and sets up the working directory.
    ```sh
    terraform init
    ```

5.  **Plan the deployment:**
    This command creates an execution plan and shows you what resources will be created, modified, or destroyed.
    ```sh
    terraform plan
    ```

6.  **Apply the configuration:**
    This command applies the changes and provisions the resources in your GCP project. Confirm the action by typing `yes` when prompted.
    ```sh
    terraform apply
    ```

## Backend Configuration

This project is configured to use a Google Cloud Storage (GCS) bucket for its [remote backend](https://developer.hashicorp.com/terraform/language/settings/backends/gcs). The backend configuration is defined in `provider.tf`, and the GCS bucket itself is created as a resource in `buckets.tf`. This setup ensures that the Terraform state is stored persistently and can be shared.

The first time you run `terraform apply`, it will create the GCS bucket. Subsequent runs will use this bucket for remote state storage as configured.

## Outputs

After a successful `terraform apply`, the configuration will provide the following outputs:

*   **`bq_dataset_id`**: The ID of the first BigQuery dataset created (`example_dataset`).
*   **`bq_output`**: The email address of the service account (`bqowner`) designated as the BigQuery data owner. This output is marked as sensitive.