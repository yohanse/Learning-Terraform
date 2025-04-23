terraform {
  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~>4.16"
    }
  }
}

resource "aws_eip" "elastic_ip" {
    tags = {
        Name = "Experiment elastic IP"
    }
}