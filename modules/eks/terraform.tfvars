region              = "ap-south-1"
cluster_name        = "my-eks-cluster"
kubernetes_version  = "1.29"
cluster_role_arn    = "arn:aws:iam::975050350815:role/EKSRole"
cluster_role_name   = "EKSRole"  # Added quotes
node_role_arn       = "arn:aws:iam::975050350815:role/EKSNodeRole"
iam_role_node       = "arn:aws:iam::975050350815:role/EKSNodeRole"  # Changed to ARN format
