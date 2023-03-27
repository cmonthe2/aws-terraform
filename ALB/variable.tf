variable "vpc_id" {
  description = "Enter the vpcid"
  type        = string
  default     = ""
}

variable "instance1_id" {
  description = "Enter the instance id"
  type        = string
  default     = ""
}


variable "instance2_id" {
  description = "Enter the instance id"
  type        = string
  default     = ""
}


variable "subnet1" {
  description = "Enter the subnet id"
  type        = string
  default     = ""
}

variable "subnet2" {
  description = "Enter the subnet id"
  type        = string
  default     = ""
}

variable "vpc_security_group_ids" {
        default = ""
}

