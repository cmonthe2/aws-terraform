variable "instance_name" {
        description = "Name of the instance to be created"
        default = "awsbuilder-demo"
}

variable "instance_type" {
        default = "t2.micro"
}

variable "vpc_security_group_ids" {
        default = "sg-0b171ef2264e7fe91"
}

variable "subnet_id" {
        description = "The VPC subnet the instance(s) will be created in"
        default = "subnet-044d33c2d7d6bd1c0"
}

variable "ami_id" {
        description = "The AMI to use"
        default = "ami-04581fbf744a7d11f"
}

variable "number_of_instances" {
        description = "number of instances to be created"
        default = 1
}


variable "ami_key_pair_name" {
        default = "tomcat"
}