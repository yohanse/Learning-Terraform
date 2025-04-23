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

resource "aws_instance" "eip_instance" {
    ami = "ami-0e449927258d45bc4"
    instance_type = "t2.micro"
    tags = {
        Name = "Experment elastic IP"
    }
}