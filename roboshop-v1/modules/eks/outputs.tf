output "cluster_endpoint" {
  value = aws_eks_cluster.example.endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = aws_eks_cluster.example.certificate_authority[0].data
}