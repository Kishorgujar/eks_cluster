variable "endpoint_private_access" {
  description = "Whether to enable private access to the EKS cluster API server."
  type        = bool
  default     = true
}

variable "cluster_tag" {
  description = "Tag for the EKS cluster."
  type        = string
  default     = "Cluster1"
}

variable "eks_role_name" {
  description = "The name of the EKS role."
  type        = string
  default     = "EKSRole"
}

variable "cluster_role_name" {
  description = "The name of the IAM role for the EKS cluster."
  type        = string
}

variable "node_group_name" {
  description = "The name of the EKS node group."
  type        = string
  default     = "MyNodeGroup"
}

variable "node_role_arn" {
  description = "The ARN of the IAM role for the EKS node group."
  type        = string
}

variable "iam_role_node" {
  description = "The ARN of the IAM role for the EKS node group."
  type        = string
}

variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "ap-south-1"  # Default region
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "my-eks-cluster"
}

variable "kubernetes_version" {
  description = "The desired Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.29"
}

variable "cluster_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster."
  type        = string
  default     = "arn:aws:iam::975050350815:role/EKSRole"
}
variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster."
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the EKS cluster."
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the EKS cluster."
  type        = list(string)
}

variable "endpoint_public_access" {
  description = "Whether to enable public access to the EKS cluster API server."
  type        = bool
  default     = true
}


