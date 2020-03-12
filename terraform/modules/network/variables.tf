variable "vpc_name" {
  description = "Name to be used on all the vpc resources as identifier"
  type        = string
  default     = ""
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {
    Terraform = true
  }
}

variable "subnets_cidr" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "azs" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "igw_name" {
  type = string
  default = ""
}

variable "public_key_path" {
  description = "Public key path"
  default = "~/.ssh/id_rsa.pub"
}

variable "rtb_public_name" {
  type = string
  default = ""
}
