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

variable "ecs_cluster_name" {
  description = "value of the ecs cluster name"
  type        = string
  default     = "fullstack-automate-backend"
}

variable "az_count" {
  description = "value of the availability zone count"
  type        = number
  default     = 2
}

variable "app_image" {
  description = "value of the application image"
  type        = string
}

variable "app_port" {
  description = "value of the application port in docker image"
  type        = number
  default     = 4000
}

variable "fargate_cpu" {
  description = "value of the fargate cpu"
  type        = string
  default     = "256"
}

variable "fargate_memory" {
  description = "value of the fargate memory"
  type        = string
  default     = "512"
}

variable "app_count" {
  description = "value of the application count"
  type        = number
  default     = 2
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default     = "myEcsTaskExecutionRole"
}
