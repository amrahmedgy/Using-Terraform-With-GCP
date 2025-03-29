variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
  default     = "terraform-gcp-455215"
}

variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone to deploy resources"
  type        = string
  default     = "us-central1-a"
}
