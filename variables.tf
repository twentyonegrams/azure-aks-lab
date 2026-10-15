variable "lab_project_subscription_id" {
  type        = string
  description = "The subscription id to run the Azure Lab Project"
}

variable "lab_project_resoucegroup_location" {
  type        = string
  description = "The region of the resourcegroup of the Azure Lab Project"
  default     = "westus3"
}