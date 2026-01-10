terraform {
  required_version = "~>1.1"

backend "gcs" {
    bucket  = "terraform_state_remote-rk"
  }
  


  required_providers{
    google ={
      version = "~> 7"
    }
  }
}