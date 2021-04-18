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
