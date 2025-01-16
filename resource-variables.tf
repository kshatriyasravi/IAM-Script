# Here we will define resource variables so that we can use them in the resource file

# Here we are defining the iam group resource, where we are creating a group in the aws cloud
variable "aws_iam_group" {
  description = "This is a devops group creatin from terraform:"
  #default     = " "    # Here i have commented this default due to this it will ask us to enter the value
  type      = string # here like what type of variable it is ex: string or number
  sensitive = false  # here we can define whether the value should be shown in the output or not
  nullable  = false  # here we can define whether the value should be null or not
  # This is a validation block where we can define the conditions for the variable
  # In the below block we are defining that the length of the variable should be greater than 0,
  # if not then it will throw an error message
  validation {
    condition     = length(var.aws_iam_group) > 0
    error_message = "Please enter the group name"
  }
}
# Here we are defining the iam user resource, where we are creating a user in the aws cloud
variable "aws_iam_user" {
  description = "This is a devops user creatin from terraform:"
  # default     = " "    # Here i am commenting this default due to this it will ask us to enter the value
  type      = string # here like what type of variable it is ex: string or number
  sensitive = false  # here we can define whether the value should be shown in the output or not
  nullable  = false  # here we can define whether the value should be null or not
  # This is a validation block where we can define the conditions for the variable
  # In the below block we are defining that the length of the variable should be greater than 0,
  # if not then it will throw an error message
  # This is the numberic validation block where we can define the conditions for the variable
  /*validation {
    condition     = var.aws_iam_user > 1 && var.aws_iam_user < 10
    error_message = "Please enter the user name"
  }
  # This is the pattern validation block where we can define the conditions for the variable
  validation {
    condition     = can(regex("^(us|eu|ap|sa|ca|af|me)-[a-z]+-\\d+$", var.aws_iam_user))
    error_message = "Invalid AWS region format."
  } */
}

