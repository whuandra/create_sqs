resource "aws_iam_user" "aws_aci" { 
  name = "aws-aci-iam-user"
  tags = local.tags
} 
