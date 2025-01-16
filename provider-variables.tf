# Here we are defining the providers variables
variable "aws_region" {
  description = "This is the region where we are going to create the resources"
  #default     = "" # Here if we define the default value then it will not ask us to enter the value
  type      = string
  sensitive = false
  nullable  = false
  # Here we are defining the validation block where we can define the conditions for the variable
  validation {
    condition     = var.aws_region != " "
    error_message = "Please enter the region"
  }
  # Here we define the validation block where we can define the conditions for the variable
  validation {
    condition     = contains(["us-east-1", "us-east-2", "us-west-1", "us-west-2"], var.aws_region)
    error_message = "Please enter the correct region"
  }

}