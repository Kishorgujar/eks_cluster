output "security_group_id" {
  description = "The ID of the security group created for the EKS cluster."
  value       = aws_security_group.eks_security_group.id
}

