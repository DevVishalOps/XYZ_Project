
variable "ami" {
    type = string
    default = var.ami
}


variable "instance_type" {
    type = string
    default = var.instance_type
}

variable "key_name" {
    type = string
    default = var.key
}

variable "vpc_security_group_id" {
    type = list(string)
    default = [ "sg-03eb9c454196b950d" ]
}