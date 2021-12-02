resource "aws_iam_user" "aws_aci" { 
  name = "aws-aci-iam-user"
} 

resource "aws_iam_group" "aws_aci_group" { 
  name = "aws_aci_Group"
}
