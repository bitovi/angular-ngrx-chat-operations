data "aws_acm_certificate" "issued" {
  domain = var.root_domain_name
}

resource "aws_elb" "vm" {
  count = var.domain_name == null ? 0 : 1
  name               = "angular-ngrx-chat-dev"
  security_groups = [aws_security_group.ec2_security_group.id]

  access_logs {
    bucket        = "bitovi-angular-ngrx-chat-operations-dev-lb-access-logs"
    bucket_prefix = "dev-logs"
    interval      = 60
  }

  listener {
    instance_port      = 80
    instance_protocol  = "https"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = data.aws_acm_certificate.issued.arn
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTPS:443/up"
    interval            = 30
  }

  instances                   = [aws_instance.server.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "bitovi-angular-ngrx-chat-operations-dev-lb"
  }
}