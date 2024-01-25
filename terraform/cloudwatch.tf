resource "aws_cloudwatch_metric_alarm" "up" {
  alarm_name          = "Auto Scaling Group UP"
  alarm_description   = "Scales up an instance when CPU utilization is greater than 80%"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 180
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.this.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.scaleup.arn]
}

resource "aws_cloudwatch_metric_alarm" "down" {
  alarm_name          = "Auto Scaling Group DOWN"
  alarm_description   = "Scales up an instance when CPU utilization is greater than 72%"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 180
  statistic           = "Average"
  threshold           = 72

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.this.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.scaledown.arn]
}

resource "aws_cloudwatch_metric_alarm" "up_mem" {
  alarm_name          = "Auto Scaling Group UP MEM"
  alarm_description   = "Scales up an instance when MEM utilization is greater than 80%"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 3
  metric_name         = "mem_used_percent"
  namespace           = "CWAgent"
  period              = 180
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.this.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.scaleup.arn]
}

resource "aws_cloudwatch_metric_alarm" "down_mem" {
  alarm_name          = "Auto Scaling Group DOWN MEM"
  alarm_description   = "Scales up an instance when MEM utilization is greater than 72%"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 3
  metric_name         = "mem_used_percent"
  namespace           = "CWAgent"
  period              = 180
  statistic           = "Average"
  threshold           = 72

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.this.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.scaledown.arn]
}
