# data "tls_certificate" "cluster-cert" {
#   url = aws_eks_cluster.prod-test-cluster.identity[0].oidc[0].issuer
# }

# resource "aws_iam_openid_connect_provider" "cluster-oicp" {
#   client_id_list  = ["sts.amazonaws.com"]
#   thumbprint_list = [data.tls_certificate.cluster-cert.certificates[0].sha1_fingerprint]
#   url             = aws_eks_cluster.prod-test-cluster.identity[0].oidc[0].issuer
# }


# resource "aws_acm_certificate_validation" "certvalidation" {
#   certificate_arn         = aws_acm_certificate.cert.arn
#   validation_record_fqdns = [for record in aws_route53_record.certvalidation : record.fqdn]

# }


# resource "aws_acm_certificate" "cert" {
#   domain_name       = var.domain_name
#   validation_method = "DNS"
     
#      lifecycle {
#       create_before_destroy = true
#   }

# }