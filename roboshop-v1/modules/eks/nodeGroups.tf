resource "aws_eks_node_group" "nodegroup_01" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.nodegroup_01_name}-${var.env}"
  node_role_arn   = aws_iam_role.nodegroup_01_role.arn
  subnet_ids      = var.subnet_ids
  instance_types  = var.ng01_instance_types

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
    aws_iam_role_policy_attachment.ng01_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.ng01_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.ng01_AmazonEC2ContainerRegistryReadOnly,
  ]
}