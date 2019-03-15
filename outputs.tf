output "http_id" {
  value = "${aws_lb_target_group.http.*.id}"
}

output "http_name" {
  value = "${aws_lb_target_group.http.*.name}"
}

output "http_arn" {
  value = "${aws_lb_target_group.http.*.arn}"
}

output "tcp_id" {
  value = "${aws_lb_target_group.tcp.*.id}"
}

output "tcp_name" {
  value = "${aws_lb_target_group.tcp.*.name}"
}

output "tcp_arn" {
  value = "${aws_lb_target_group.tcp.*.arn}"
}