variable "region" {
  description = "The AWS region to create the VPC in."
  type        = string
  default     = "ap-south-1"
}

variable "vpc_name" {
  description = "Name of the VPC."
  type        = string
}


variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet1_cidrs" {
  description = "List of public subnet CIDR blocks."
  type        = list(string)
}

variable "public_subnet2_cidrs" {
  description = "List of public subnet CIDR blocks."
  type        = list(string)
}

variable "az_count" {
  description = "Number of Availability Zones."
  type        = number
  default     = 2  # Adjust if you want to hard-code or handle dynamically
}

variable "azs" {
  description = "List of Availability Zones."
  type        = list(string)
}

variable "kubernetes_version" {
  description = "The desired Kubernetes version."
  type        = string
  default     = "1.29"  # Change this to the desired version
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}
