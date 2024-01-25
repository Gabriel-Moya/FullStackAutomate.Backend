locals {
  common_tags = {
    ManagedBy = "Terraform"
  }
  subnet_ids = { for k, v in aws_subnet.this : v.tags.Name => v.id }
}