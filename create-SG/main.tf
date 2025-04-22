terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.16"
    }
  }
}

resource "aws_security_group" "terraform-firewall" {
    name = "terraform-firewall"
    description = "Allow SSH and HTTP traffic"

    tags = {
        Name = "terraform-firewall"

        Environment = "Learning Terraform"
    }
}

resource "aws_vpc_security_group_ingress_rule" "allow_terraform_tls"{
    security_group_id = aws_security_group.terraform-firewall.id
    ip_protocol = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 80
    to_port = 80
}


resource "aws_vpc_security_group_egress_rule" "allow_all" {
    security_group_id = aws_security_group.terraform-firewall.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
}