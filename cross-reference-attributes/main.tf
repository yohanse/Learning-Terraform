terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>4.16"
        }
    }
}


resource "aws_eip" "elastic_ip" {
    tags = {
        Name = "Terraform Elastic IP"
    }
}


resource "aws_security_group" "terraform-SG" {
    name = "terraform-SG"
    description = "Adding security for learning purpose"
}