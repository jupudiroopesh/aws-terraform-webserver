variable "number_of_instances" {
  description = "Number of instances to create and attach to ELB"
  default     = 1
}

variable "vpc_id" {
  default = ""
}

variable "instance_ami" {
  default = "ami-0e2ff28bfb72a4e45"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {
    Terraform = true
  }
}

variable "public_subnet_ids" {
  type = list(string)
  default = []
}

variable "security_group_ids" {
  description = "EC2 ssh security group"
  type = list(string)
  default = []
}

variable "key_pair_name" {
  description = "EC2 Key pair name"
  default = ""
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "user_data" {}