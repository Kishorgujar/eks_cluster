output "cluster_endpoint" {
  description = "The endpoint of the EKS cluster."
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = aws_eks_cluster.this.name
}

output "cluster_certificate_authority" {
  description = "The certificate authority data for the EKS cluster."
  value       = aws_eks_cluster.this.certificate_authority[0].data
}

output "cluster_id" {
  value = aws_eks_cluster.this.id
}

