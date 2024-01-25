variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "value of the instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_key_pair_name" {
  description = "value of the key name"
  type        = string
}
