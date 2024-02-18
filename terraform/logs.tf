resource "aws_cloudwatch_log_group" "this" {
  name              = "/ecs/terraform"
  retention_in_days = 14

  tags = {
    Name = "tf-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "log_stream" {
  name           = "tf-log-stream"
  log_group_name = aws_cloudwatch_log_group.this.name
}
