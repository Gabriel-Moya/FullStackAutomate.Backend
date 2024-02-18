output "vpc_id" {
  value = aws_vpc.this.id
}

output "igw_id" {
  value = aws_internet_gateway.this.id
}

output "security_group_alb_id" {
  value = aws_security_group.alb.id
}

output "alb_id" {
  value = aws_lb.this.id
}

output "alb_dns_name" {
  value = aws_lb.this.dns_name
}
