variable "vpc_id" {
  description = "VPC id"
  default = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {
    Terraform = true
  }
}