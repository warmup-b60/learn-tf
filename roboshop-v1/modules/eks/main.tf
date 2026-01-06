resource "aws_eks_cluster" "example" {
  name = "example"

  role_arn = aws_iam_role.cluster.arn
  version  = "1.33"

  vpc_config {
    subnet_ids = [
      "subnet-00ceb02053ec025ac",
      "subnet-070af22169c534e0e"
    ]
  }

  # Ensure that IAM Role permissions are created before and deleted
  # after EKS Cluster handling. Otherwise, EKS will not be able to
  # properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
  ]
}

output "cluster_endpoint" {
  value = aws_eks_cluster.example.endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = aws_eks_cluster.example.certificate_authority[0].data
}