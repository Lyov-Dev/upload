
# resource "aws_route53_record" "a_record" {
#    name    = var.domain_name
#    zone_id = var.route53ZoneID
#    type    = "A"
  
#  alias {
#    name = aws_cloudfront_distribution.a_record.name.domain_name
#    zone_id= aws_cloudfront_distribution.a-record.zone_id.route53ZoneID
#    evaluate_target_health = false
  
#   }
# }

# record certificate validation
# resource "aws_route53_record" "certvalidation" {
#     for_each = {
#     for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }

#   allow_overwrite = true
#   name            = each.value.name
#   records         = [each.value.record]
#   ttl             = 60
#   type            = each.value.type
#   zone_id         = var.hosted_zone_id
# }


#  data "aws_route53_zone" "zone" {
#   name = var.domain_name
# }

# resource "aws_route53_record" "webhosting" {
  
#   zone_id = data.aws_route53_zone.zone.zone_id
#   name    = var.domain_name
#   type    = "A"

# alias {
#     name                   = aws_cloudfront_distribution.nlb_distrib.domain_name
#     zone_id                = aws_cloudfront_distribution.nlb_distrib.hosted_zone_id
#     evaluate_target_health = true
#   }
# }

# # creating record for RDS
# resource "aws_route53_record" "rds_cname" {
#   zone_id = data.aws_route53_zone.zone.zone_id
#   name    = var.db_domain_name
#   type    = "CNAME"
#   ttl     = 300
#   records = [aws_db_instance.rds-instance.address]
# }

# #For monitoring

# resource "aws_route53_record" "EC2_subdomain" {
#   name    = var.ec2_subdomain_name
#   zone_id = data.aws_route53_zone.zone.zone_id
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.PROD_INSTANCE.public_ip]
# }
