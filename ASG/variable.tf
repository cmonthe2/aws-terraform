variable "vpc_id" {
  description = "Enter the vpcid"
  type        = string
  default     = "vpc-099100efed29895a1"
}

variable "vpc_security_group_ids" {
  default = "sg-0b171ef2264e7fe91"
}

variable "subnet1" {
  description = "Enter the subnet id"
  type        = string
  default     = "subnet-044d33c2d7d6bd1c0"
}

variable "subnet2" {
  description = "Enter the subnet id"
  type        = string
  default     = "subnet-0c525030866e6f480"
}


