output "lb_target_group_arn" {
  value = aws_lb_target_group.fade_tg.arn
}

output "lb_endpoint" {
  value = aws_lb.fade_lb.dns_name
}
