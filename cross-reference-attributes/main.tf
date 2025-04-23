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


resource "aws_vpc_security_group_ingress_rule" "inbound_rule_one" {
    security_group_id = aws_security_group.terraform-SG.id
    from_port = 443
    to_port = 443
    ip_protocol = "tcp"
    cidr_ipv4 = "${aws_eip.elastic_ip.public_ip}/32"
}