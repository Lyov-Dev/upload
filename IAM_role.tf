resource "aws_iam_user" "user" {
  name = var.user_name
}

#crate policy 
resource "aws_iam_user_policy_attachment" "attach-user" {
  user       = aws_iam_user.user.name
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonSSMFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  ])
   policy_arn = each.value
} 
 
#create role to EC2 for smm 
resource "aws_iam_role" "smm_role" {
  name = "smm_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

#profile
resource "aws_iam_instance_profile" "EC2_profile" {
  name = "EC2_profile"
  role = aws_iam_role.smm_role.id
}



