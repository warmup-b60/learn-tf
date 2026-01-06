# Fetch the VPC ID (replace with your actual VPC ID or data source)
data "aws_vpc" "example" {
  default = true
}

# Define a security group for the EKS Control Plane
resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks-cluster-sg"
  description = "Security group for EKS cluster API access"
  vpc_id      = "vpc-0031cc952da0c7bfc"

  # Allow inbound traffic on port 443 from specific CIDR (e.g., your office IP or bastion host SG)
  # IMPORTANT: Restrict source CIDR as needed for security best practices
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"] # REPLACE WITH YOUR CIDR or SG ID
    description = "Allow access to k8s API server from specified IPs"
  }

  # Allow all outbound traffic (EKS control plane needs to reach worker nodes and AWS services)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define a security group for the EKS Worker Nodes
resource "aws_security_group" "eks_worker_node_sg" {
  name        = "eks-worker-node-sg"
  description = "Security group for EKS worker nodes"
  vpc_id      = "vpc-0031cc952da0c7bfc"

  # Inbound from EKS Control Plane on port 10250 (Kubelet API)
  ingress {
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    # Source is the Cluster Security Group itself
    security_groups = [aws_security_group.eks_cluster_sg.id]
    description     = "Allow Kubelet API access from EKS Control Plane"
  }

  # Inbound from EKS Control Plane on port 443 (if using private endpoint)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # Source is the Cluster Security Group itself
    security_groups = [aws_security_group.eks_cluster_sg.id]
    description     = "Allow API server access from Control Plane"
  }

  # Inbound SSH access (port 22) from a bastion host SG or specific IP range for management
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"] # REPLACE WITH YOUR BASTION HOST IP
    description = "Allow SSH access to worker nodes"
  }

  # Inbound from Load Balancers/other pods on NodePort range (30000-32767)
  # If you use the aws-load-balancer-controller, it manages these rules for you
  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict as needed if LB subnets are known
    description = "Allow NodePort access for services"
  }

  # Allow all outbound traffic from worker nodes to the internet and AWS services
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
