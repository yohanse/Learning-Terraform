output "public_ip_address" {
  value = aws_eip.elastic_ip.public_ip
}