variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created."
  type        = string
}

variable "allowed_cidrs" {
  description = "List of CIDR blocks allowed to access the EKS cluster."
  type        = list(string)
}

