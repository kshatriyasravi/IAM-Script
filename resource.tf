# THis is a resource file where we define the resources we need to create in the cloud
resource "aws_iam_group" "Devops-group" {
  name = var.aws_iam_group
}
output "Devops-Group-Output" {
  value = aws_iam_group.Devops-group.name
}
# Here we are creating the user in the aws cloud with the given name
resource "aws_iam_user" "Username" {
  name = var.aws_iam_user
}
output "Devops-User-Output" {
  value = aws_iam_user.Username.name
}
# Here we are defining the access key and the secret key for the user
# So that the user can access the aws cloud with the help of the access key and the secret key
resource "aws_iam_access_key" "Access-Key" {
  user = aws_iam_user.Username.name
}
output "Access_Key_Output" {
  # Here you are defining the output for the access key, so you need to define id not the name in the value
  value     = aws_iam_access_key.Access-Key.id
  sensitive = true
}
# Here we are defining the secret key for the user
resource "aws_iam_access_key" "secret_key" {
  user = aws_iam_user.Username.id

}
output "secret_key_Output" {
  # Here you are defining the output for the secret key, so you need to define secret not the name or id  in the value
  value     = aws_iam_access_key.secret_key.secret
  sensitive = true
}
# Here we are attaching the user to the group
resource "aws_iam_group_membership" "Group-Membership" {
  name = var.aws_iam_user
  # Here we are fetching the name from the iam user resource
  users = [aws_iam_user.Username.name]
  # Here we are fetching the name from the iam group resource
  group = aws_iam_group.Devops-group.name
}
output "Devops-Group-Membership-Output" {
  value = aws_iam_group_membership.Group-Membership.name
}
# Here we are attaching the policy to the group
# Like for now we are attaching the ec2 full access policy to the group, so that the group will have the full access to the ec2
# Whoever added to this group will have the full access to the ec2
# Note: We are attaching the policy to the group not to the user 
# And the resource we are defining here is the policy attachment not the policy,
# And we need to define the difference between the policy and the policy attachment, 
# The policy is the policy which we are going to attach to the group or user (We can use the policy in single place and need to create a new policy for another group or user)
# And the policy attachment is the attachment of the policy to the group or user (We can use the policy attachment in multiple places, and this is the custome polcy so we can directly use in multiple places)
resource "aws_iam_group_policy_attachment" "Policy_For_Group" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  group      = aws_iam_group.Devops-group.name

}
output "Devops-Group-Policy-Output" {
  value = aws_iam_group_policy_attachment.Policy_For_Group.policy_arn
}
