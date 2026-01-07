resource "aws_eks_node_group" "nodegroup_01" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.nodegroup_01_name}-${var.env}"
  node_role_arn   = aws_iam_role.nodegroup_01_role.arn
  subnet_ids = var.subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.ng01-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.ng01-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.ng01-AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_iam_role" "nodegroup_01_role" {
  name = "${var.eks_nodegroup_01_role_name}-${var.env}"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "ng01-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodegroup_01_role.name
}

resource "aws_iam_role_policy_attachment" "ng01-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodegroup_01_role.name
}

resource "aws_iam_role_policy_attachment" "ng01-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodegroup_01_role.name
}