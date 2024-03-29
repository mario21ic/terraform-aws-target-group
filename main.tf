resource "aws_lb_target_group" "http" {
  count = "${var.type  == "http" ? var.count : 0}"

  name        = "${var.env}-tg-${var.name}-${count.index}"
  target_type = "${var.target_type}"

  vpc_id   = "${var.vpc_id}"
  protocol = "HTTP"
  port     = "${var.port}"

  health_check {
    protocol            = "HTTP"
    path                = "${var.health_check_path}"
    port                = "traffic-port"

    healthy_threshold   = "${var.health_check_healthy_threshold}"
    unhealthy_threshold = "${var.health_check_unhealthy_threshold}"
    interval            = "${var.health_check_interval}"

    timeout             = "${var.health_check_timeout}"
    matcher             = "${var.health_check_matcher}"
  }
}

resource "aws_lb_target_group" "tcp" {
  count = "${var.type  == "tcp" ? var.count : 0}"

  name        = "${var.env}-tg-${var.name}-${count.index}"
  target_type = "${var.target_type}"

  proxy_protocol_v2 = false
  slow_start        = 0

  vpc_id   = "${var.vpc_id}"
  protocol = "TCP"
  port     = "${var.port}"

  health_check {
    protocol            = "TCP"
    port                = "traffic-port"

    healthy_threshold   = "${var.health_check_healthy_threshold}"
    unhealthy_threshold = "${var.health_check_unhealthy_threshold}"
    interval            = "${var.health_check_interval}"
  }
}
