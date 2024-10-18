output "eks_role_arn" {
  value = aws_iam_role.eks_role.arn
}

output "node_role_arn" {
  value = aws_iam_role.node_role.arn
}

output "AWS_LoadBalancer_Controller_Policy_ID" {
  value = aws_iam_policy.AWS_LoadBalancer_Controller_Policy.arn
}
