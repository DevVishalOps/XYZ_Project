
variable "ami" {
    type = string
}


variable "instance_type" {
    type = string
}

variable "key_name" {
    type = string
}

variable "vpc_security_group_id" {
    type = list(string)
}