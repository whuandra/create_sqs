provider "aws" {
  region = "us-east-1"
  }

resource "aws_kms_key" "win_kms" {
  enable_key_rotation = true
}

resource "aws_kms_alias" "win_kms" {
  name = "alias/tf_queue"
  target_key_id = aws_kms_key.win_kms.key_id
}

resource "aws_sqs_queue" "win_queue" {
  name = "tf_queue"
  delay_seconds = 90
  max_message_size = 4096
  kms_master_key_id = "alias/tf_queue"
  tags = {
    environment = "dev"
    }
  }
resource "aws_sqs_queue_policy" "test" {
  queue_url = aws_sqs_queue.win_queue.id
  
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.win_queue.arn}"
    }
  ]
}
POLICY
}
