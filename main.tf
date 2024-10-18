module "vpc" {
  source                     = "./modules/vpc"
  region                     = var.region
  vpc_name                   = var.vpc_name
  vpc_cidr                   = var.vpc_cidr
  azs                        = var.azs
  public_pub_subnet1_cidrs   = ["192.168.0.0/20"]
  public_pub_subnet2_cidrs   = ["192.168.16.0/20"]
  private_subnet1_cidrs      = ["192.168.32.0/20"]
  private_subnet2_cidrs      = ["192.168.64.0/20"]
  private_subnet3_cidrs      = ["192.168.96.0/20"]
  private_subnet4_cidrs      = ["192.168.112.0/20"]
}

module "security_group" {
  source       = "./modules/security_group"
  vpc_id       = module.vpc.vpc_id
  allowed_cidrs = ["0.0.0.0/0"]  # Modify as needed
}

module "iam_roles" {
  source                             = "./modules/iam_role"
  eks_role_name                     = "EKSRole"
  eks_role_tag                      = "EKS"
  node_role_name                    = "EKSNodeRole" 
  node_role_tag                     = "NodeGroup"
  load_balancer_controller_policy_name = "AWSLoadBalancerControllerIAMPolicy"  # Added
}

module "eks" {
  source                     = "./modules/eks"
  region                     = var.region
  cluster_name               = var.cluster_name
  cluster_role_arn           = module.iam_roles.eks_role_arn
  node_role_arn              = module.iam_roles.node_role_arn
  kubernetes_version         = var.kubernetes_version
  cluster_role_name          = "EKSRole"  # Added
  iam_role_node              = module.iam_roles.node_role_arn  # Added
  node_group_name            = "MyNodeGroup"
  load_balancer_controller_policy_name = "AWSLoadBalancerControllerIAMPolicy"  # Added
  subnet_ids                 = concat(
    module.vpc.public_pub_subnet1_ids,
    module.vpc.public_pub_subnet2_ids,
    module.vpc.private_sub1_ids,
    module.vpc.private_sub2_ids,
    module.vpc.private_sub3_ids,
    module.vpc.private_sub4_ids
  )

  private_subnet_ids         = concat(
    module.vpc.private_sub1_ids,
    module.vpc.private_sub2_ids
  )

  security_group_ids         = [module.security_group.security_group_id]
  endpoint_public_access      = true
  endpoint_private_access     = true
  cluster_tag                = "Cluster1"
}
