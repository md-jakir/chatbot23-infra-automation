output "internet_alb_tg_arn" {
  value = aws_lb_target_group.internet_alb_tg.arn
}

output "internet_alb_arn" {
  value = aws_lb.internet_alb.id
}

output "internet_security_group_id" {
  value = aws_security_group.internet_alb_sg.id
}

output "internal_alb_tg_arn" {
  value = aws_lb_target_group.internal_alb_tg.arn
}

output "internal_alb_arn" {
  value = aws_lb.internal_alb.id
}

output "internal_security_group_id" {
  value = aws_security_group.internal_alb_sg.id
}

output "db_security_group_ids" {
  value = aws_security_group.db_security_group.id
}

output "frontend_security_group" {
  value = aws_security_group.frontend_app_sg.id
}