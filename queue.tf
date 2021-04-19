provider "aws" {
  region = "us-east-1"
  }

resource "aws_sqs_queue" "win_queue" {
  name = "tf_queue"
  delay_seconds = 90
  max_message_size = 2048
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
      "Resource": "${aws_sqs_queue.win_queue.arn}",
    }
  ]
}
POLICY
}
