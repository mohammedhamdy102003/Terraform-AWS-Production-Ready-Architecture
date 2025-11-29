output "ami" {
    value = var.nginx_ami_id
}
output "instance_type" {
    value = var.nginx_instance_type
}
output "bastion_instance_id" {
    value = aws_instance.nginx.id
}
output "bastion_public_ip" {
    value = aws_instance.nginx.public_ip
}
output "bastion_private_ip" {
    value = aws_instance.nginx.private_ip
}
output "bastion_subnet_id" {
    value = var.nginx_subnet_id
}
output "bastion_security_group_ids" {
    value = var.nginx_security_group_ids
}
