resource "aws_lb" "this" {
  name            = "Terraform-ALB"
  subnets         = aws_subnet.public.*.id
  security_groups = [aws_security_group.alb.id]

  tags = merge(local.common_tags, { Name = "Terraform ALB" })
}

resource "aws_lb_target_group" "this" {
  name        = "ALB-TG"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.this.id
  target_type = "ip"

  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    port                = "traffic-port"
    protocol            = "HTTP"
  }
}

resource "aws_alb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
