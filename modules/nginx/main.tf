resource "aws_instance" "nginx" {
    ami           = var.nginx_ami_id
    instance_type = var.nginx_instance_type
    subnet_id     = var.nginx_subnet_id
    key_name      = var.nginx_key_name
    vpc_security_group_ids = var.nginx_security_group_ids

    tags = {
        Name = "nginx_server"
    }
    user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install nginx -y
                sudo systemctl start nginx
                sudo systemctl enable nginx
                EOF
  
}
resource "aws_security_group" "nginx_sg" {
    name = "nginx_sg"
    description = "Security group for nginx server"
    vpc_id=aws_vpc.main.id 
    ingress ={
        form_port=80
        to_port=80
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
