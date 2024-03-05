terraform {
  backend "s3" {
        bucket = "my-terraform-motogp-backend-bucket"
        region = "ap-south-1" 
        key = "terraform.tfstate"
        #dynamodb_table = "my-state-lock-table"
  }
}
resource "aws_instance" "ubuntu1" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.xyz-sg.id]
    # vpc_security_group_ids = var.vpc_security_group_id
    user_data = file("${path.module}/ansible.sh")
    tags = {
      Name = "Ansible-Master"
      Environment = "Hello world"
      Project = "Motogp Project"
      Owner = "vishal"
    }
}

resource "aws_instance" "ubuntu2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.xyz-sg.id]
    # vpc_security_group_ids = var.vpc_security_group_id
    tags = {
      Name = "Ansible-Node-1"
      Environment = "Hello world"
      Project = "Motogp Project"
      Owner = "vishal"
    }
}
resource "aws_instance" "ubuntu3" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.xyz-sg.id]
    # vpc_security_group_ids = var.vpc_security_group_id
    tags = {
      Name = "Ansible-Node-2"
      Environment = "Hello world"
      Project = "Motogp Project"
      Owner = "vishal"
    }
}

resource "aws_instance" "ubuntu4" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.xyz-sg.id]
    # vpc_security_group_ids = var.vpc_security_group_id
    user_data = file("${path.module}/node_exporter-for-main.sh")
    tags = {
      Name = "feuture-used"
      Environment = "Hello world"
      Project = "motogp Project"
      Owner = "vishal"
    }
}
resource "aws_instance" "ubuntu5" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.xyz-sg.id]
    # vpc_security_group_ids = var.vpc_security_group_id
    tags = {
      Name = "Monitoring"
      Environment = "Hello world"
      Project = "motogp Project"
      Owner = "vishal"
    }
}