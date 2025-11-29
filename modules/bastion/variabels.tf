variable "bastion_ami_id" {
    type = string
    default = "ami-0c55b159cbfafe1f0"
}
variable "bastion_instance_type" {
    type = string
    default = "t2.micro"
}
variable "bastion_key_name" {
    type = string
    default = "my-key-pair"
}
variable "bastion_subnet_id" {
    type = string
    default = "10.0.1.0/24"
}
variable "bastion_security_group_ids" {
    type = list(string)
    default = [ "sg-0123456789abcdef0" ]
}
