output "alb_dns_name" {
  description = "The DNS name of the internal Application Load Balancer."
  value       = aws_lb.application_lb.dns_name
}

output "alb_sg_id" {
  description = "The Security Group ID of the Application Load Balancer."
  value       = aws_security_group.alb_sg.id
}