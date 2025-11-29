resource "aws_instance" "nginx" {
    ami           = var.nginx_ami_id
    instance_type = var.nginx_instance_type
    subnet_id     = var.nginx_subnet_id
    key_name      = var.nginx_key_name
    vpc_security_group_ids = var.nginx_security_group_ids

    tags = {
        Name = "nginx_server"
    }
  
}