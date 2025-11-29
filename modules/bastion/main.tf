resource "aws_instance" "bastion" {
    ami=var.bastion_ami_id
    instance_type=var.bastion_instance_type
    subnet_id=var.bastion_subnet_id
    key_name=var.bastion_key_name
    vpc_security_group_ids=var.bastion_security_group_ids
    tags = {
        Name = "bastion_host"
    }
}