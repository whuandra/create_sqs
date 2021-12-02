resource "aws_iam_user" "aws_aci" { 
  name = "aws-aci-iam-user"
} 

resource "aws_iam_group" "aws_aci_group" { 
  name = "aws_aci_Group"
}

resource "aws_iam_group_membership" "aws_aci_membership" { 
  name  = "ACIGroupMembership"
  group = aws_iam_group.aws_aci_group.name
  users = [
    aws_iam_user.aws_aci.name
  ]
}

