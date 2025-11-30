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
resource "aws_security_group" "bastion_sg" {
    name = "bastion_sg"
    description = "Security group for bastion host"
    vpc_id=aws_vpc.main.id 
    ingress = {
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]

    }
    egress ={
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]

    }
  
}

