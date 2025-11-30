resource "aws_security_group" "mongo-sg" {
     name = "mongo-sg"
        description = "Security group for MongoDB servers"
        vpc_id = var.vpc_id
    ingress {
        from_port   = 27017
        to_port     = 27017
        protocol    = "tcp"
        security_groups = [var.app_sg_id]
        description = "Allow MongoDB access from Application Tier"
  
}
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
    }
}
resource "aws_instance" "Mongodb" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = element(var.private_subnet_ids, count.index % length(var.private_subnet_ids))
    vpc_security_group_ids = [aws_security_group.mongo-sg.id]
    count = 2
    tags = {
        Name = "MongoDB-Server-${count.index + 1}"
    }

  
}
