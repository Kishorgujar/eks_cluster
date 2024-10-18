resource "aws_cloudwatch_log_group" "EKS_CLUSTER_LOGS" {
  # The log group name format is /aws/eks/<cluster-name>/cluster
  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = 7
}

resource "aws_eks_cluster" "this" {
  name                       = var.cluster_name
  role_arn                   = var.cluster_role_arn
  version                    = var.kubernetes_version
  enabled_cluster_log_types   = ["api", "audit"]
  
  tags = {
    Name = var.cluster_tag
  }

  vpc_config {
    subnet_ids              = var.subnet_ids
    security_group_ids      = var.security_group_ids
    endpoint_public_access  = var.endpoint_public_access
    endpoint_private_access = var.endpoint_private_access
  }

  depends_on = [
    aws_cloudwatch_log_group.EKS_CLUSTER_LOGS
  ]
}

resource "aws_eks_node_group" "ec2_worker_nodes" {
  cluster_name   = aws_eks_cluster.this.name
  node_group_name = var.node_group_name
  node_role_arn   = var.iam_role_node
  subnet_ids      = var.private_subnet_ids  # This should be 'subnet_ids'

  scaling_config {
    desired_size = 3
    max_size     = 3
    min_size     = 3
  }

  depends_on = [
    aws_eks_cluster.this
  ]
}

resource "aws_eks_addon" "Fargate_EKS_VPC_CNI" {
  cluster_name = var.cluster_name
  addon_name   = "vpc-cni"
}


