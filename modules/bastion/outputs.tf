output "ami" {
    value = var.bastion_ami_id
}
output "instance_type" {
    value = var.bastion_instance_type
}
output "bastion_instance_id" {
    value = aws_instance.bastion.id
}
output "bastion_public_ip" {
    value = aws_instance.bastion.public_ip
}
output "bastion_private_ip" {
    value = aws_instance.bastion.private_ip
}
output "bastion_subnet_id" {
    value = var.bastion_subnet_id
}
output "bastion_security_group_ids" {
    value = var.bastion_security_group_ids
}
