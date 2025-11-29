variable "nginx_ami_id" {
    type = string
    default = "ami-0c55b159cbfafe1f0"
}
variable "nginx_instance_type" {
    type = string
    default = "t2.micro"
}
variable "nginx_key_name" {
    type = string
    default = "my-key-pair"
}
variable "nginx_subnet_id" {
    type = string
    default = "10.0.3.0/24"
}
variable "nginx_security_group_ids" {
    type = list(string)
    default = [ "sg-0abcdef1234567890" ]
}
