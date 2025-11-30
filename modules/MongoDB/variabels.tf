variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "private_subnet_ids" {
  description = "List of Private Subnet IDs for the MongoDB instances."
  type        = list(string)
}

variable "ami_id" {
  description = "The AMI ID for the EC2 MongoDB server."
  type        = string
}

variable "instance_type" {
  description = "The instance type for the MongoDB server (e.g., t3.medium)."
  type        = string
}

variable "app_sg_id" {
  description = "The Security Group ID of the Application Tier (ASG) to allow access from."
  type        = string
}