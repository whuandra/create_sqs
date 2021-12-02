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






resource "aws_iam_policy" "aws_aci_pol" { 
  name  = "aci-iam-policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1555443955472",
      "Action": [
        "sqs:GetQueueAttributes",
        "sqs:GetQueueUrl",
        "sqs:SendMessage",
        "sqs:SendMessageBatch",
        "sqs:DeleteMessage",
        "sqs:DeleteMessageBatch",
        "sqs:ReceiveMessage",
        "sqs:ListQueues"
      ],
      "Effect": "Allow",
      "Resource": [
        "${module.wires-prod_sqs.arn}"
      ]
    }
  ]
}
EOF

}
