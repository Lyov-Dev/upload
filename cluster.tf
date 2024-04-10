#EKS cluster role
resource "aws_iam_role" "cluster_role" {
  name = "eks_cluster_role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
  POLICY
}
#ATACHING POLICY TO CLUSTER

resource "aws_iam_role_policy_attachment" "cluster-role-AmazonEksClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster_role.name
}


resource "aws_eks_cluster" "prod-test-cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.cluster-public-us-east-1b.id,
      aws_subnet.cluster-public-us-east-1c.id,
      aws_subnet.cluster-public-us-east-1d.id
      
    ]

  }
  depends_on = [
    aws_iam_role_policy_attachment.cluster-role-AmazonEksClusterPolicy
  ]
}


resource "aws_security_group_rule" "app_port" {
  

    type            = "ingress"
    from_port       = 30001
    to_port         = 30001
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_eks_cluster.prod-test-cluster.vpc_config[0].cluster_security_group_id
}