# THis is a provider file were we deinfe which cloud we need to use for terraform
terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}
provider "aws" {
  # Here we are definying the variables for the region
  # Like we provide one validation like the region should be from the given list
  # If not then it will throw an error message
  #region = "us-east-2"
  region = var.aws_region

}