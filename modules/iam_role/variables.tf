variable "eks_role_name" {
  description = "The name of the EKS role"
  type        = string
}

variable "eks_role_tag" {
  description = "Tag for the EKS role"
  type        = string
}

variable "node_role_name" {
  description = "The name of the Node role"
  type        = string
}

variable "node_role_tag" {
  description = "Tag for the Node role"
  type        = string
}

variable "load_balancer_controller_policy_name" {
  description = "The name for the Load Balancer Controller IAM policy"
  type        = string
}
