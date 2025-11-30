resource "aws_security_group" "alb_sg" {
    name = "${var.alb_name}-sg"
    vpc_id = aws_vpc.main.id 
    ingress = {
        from_port = 80
        to_port   = 80
        protocol  = "tcp"
        security_groups = var.alb_security_group_ids
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress = {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]

  
}
}
resource "aws_security_group" "app_sg" {
    name = "${var.asg_name}-sg"
    vpc_id = aws_vpc.main.id 
    ingress = {
        from_port = 80
        to_port   = 80
        protocol  = "tcp"
        security_groups = [aws_security_group.alb_sg.id]
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        security_groups = var.asg_security_group_ids
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress = {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]
}
}
resource "aws_alb" "alb" {
    name = var.alb_name
    internal = true
    security_groups = [aws_security_group.alb_sg.id]
    subnets = var.subnet_ids
    idle_timeout = 400
    enable_deletion_protection = false
    load_balancer_type = "application"

  
}
resource "aws_alb_target_group" "tg" {
    name = "${var.alb_name}-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
    health_check {
        path = "/"
        interval = 30
        timeout = 5
        healthy_threshold = 5
        unhealthy_threshold = 2
        matcher = "200-399"
    }
}
resource "aws_lb_listener" "http_listener" {
    load_balancer_arn = aws_alb.alb.arn
    port = "80"
    protocol = "HTTP"
    default_action {
        type = "forward"
        target_group_arn = aws_alb_target_group.tg.arn
    }
  
}
resource "aws_launch_template" "asg_launch_template" {
    name_prefix = "${var.asg_name}-lt-"
    image_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    user_data = base64encode(var.user_data)
    vpc_security_group_ids = [aws_security_group.app_sg.id]
  
}
resource "aws_autoscaling_group" "asg" {
    name = var.asg_name
    max_size = var.max_size
    min_size = var.min_size
    desired_capacity = var.desired_capacity
    vpc_zone_identifier = var.subnet_ids
    launch_template {
        id = aws_launch_template.asg_launch_template.id
        version = "$Latest"
    }
    target_group_arns = [aws_alb_target_group.tg.arn]
    tag {
        key = "Name"
        value = var.asg_name
        propagate_at_launch = true
    }
  
}

