variable "eks_role_name" {
  description = "The name of the EKS role."
  type        = string
  default     = "EKSRole"
}

variable "eks_role_tag" {
  description = "The tag for the EKS role."
  type        = string
  default     = "EKS"
}

variable "node_role_name" {
  description = "The name of the Node role."
  type        = string
  default     = "EKSNodeRole"
}

variable "node_role_tag" {
  description = "The tag for the Node role."
  type        = string
  default     = "NodeGroup"
}
variable "load_balancer_controller_policy_name" {
  description = "The name of the AWS Load Balancer Controller IAM Policy"
  type        = string
  default     = "AWSLoadBalancerControllerIAMPolicy"
}


