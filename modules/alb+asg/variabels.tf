variable "vpc_id" {
    description = "The ID of the VPC where the ALB and ASG will be deployed."
    type        = string
}
variable "subnet_ids" {
    description = "A list of subnet IDs for the ALB and ASG."
    type        = list(string)
}
variable "alb_name" {
    description = "The name of the Application Load Balancer."
    type        = string
    default     = "my-alb"
}
variable "asg_name" {
    description = "The name of the Auto Scaling Group."
    type        = string
    default     = "my-asg"
}
variable "instance_type" {
    description = "The instance type for the Auto Scaling Group."
    type        = string
    default     = "t2.micro"
}
variable "desired_capacity" {
    description = "The desired capacity of the Auto Scaling Group."
    type        = number
    default     = 2
}
variable "max_size" {
    description = "The maximum size of the Auto Scaling Group."
    type        = number
    default     = 4
}
variable "min_size" {
    description = "The minimum size of the Auto Scaling Group."
    type        = number
    default     = 1
}
variable "alb_security_group_ids" {
    description = "A list of security group IDs to associate with the ALB."
    type        = list(string)
    default     = []
}
variable "asg_security_group_ids" {
    description = "A list of security group IDs to associate with the ASG."
    type        = list(string)
    default     = []
}
variable "key_name" {
    description = "The key name to use for the EC2 instances in the ASG."
    type        = string
    default     = ""
}
variable "ami_id" {
    description = "The AMI ID to use for the EC2 instances in the ASG."
    type        = string
}
variable "user_data" {
    description = "The user data script to provide to the EC2 instances in the ASG."
    type        = string
    default     = ""
}
