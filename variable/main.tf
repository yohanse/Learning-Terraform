terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>4.16"
        }
    }
}


resource "aws_security_group" "terraform-SG" {
    name = "Terraform-SG"
    description = "Learning Experience"
    tags = {
        name = "Terraform-Security-Group"
    }
}

resource "aws_vpc_security_group_ingress_rule" "app_port" {
    ip_protocol = "tcp"
    cidr_ipv4 = var.vpc_ip_address
    from_port = var.app_port
    to_port = var.app_port
    security_group_id = aws_security_group.terraform-SG.id
}


resource "aws_vpc_security_group_ingress_rule" "ssh_port" {
    ip_protocol = "tcp"
    cidr_ipv4 = var.vpc_ip_address
    from_port = var.ssh_port
    to_port = var.ssh_port
    security_group_id = aws_security_group.terraform-SG.id
}

resource "aws_vpc_security_group_ingress_rule" "ftp_port" {
    ip_protocol = "tcp"
    cidr_ipv4 = var.vpc_ip_address
    from_port = var.ftp_port
    to_port = var.ftp_port
    security_group_id = aws_security_group.terraform-SG.id
}