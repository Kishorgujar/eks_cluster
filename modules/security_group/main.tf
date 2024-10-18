resource "aws_security_group" "eks_security_group" {
  name        = "eks-security-group"  # Use a static name
  description = "Security group for EKS cluster and nodes"
  vpc_id      = var.vpc_id

  // Ingress rules
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidrs  // Allowed CIDR blocks to access the cluster
  }

  ingress {
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidrs
  }

  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidrs
  }

  // Egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  // All traffic
    cidr_blocks = ["0.0.0.0/0"]  // Allow all outbound traffic
  }

  tags = {
    Name = "eks-security-group"
  }
}

