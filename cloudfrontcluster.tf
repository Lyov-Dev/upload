
# resource "aws_cloudfront_distribution" "nlb_distrib" {
#   enabled = true
#    aliases = ["${var.domain_name}"]

#   origin {
    
#     domain_name = aws_lb.nlb.dns_name
#     origin_id   = aws_lb.nlb.dns_name
  
#   custom_origin_config {
#       http_port              = 80
#       https_port             = 443
#       origin_protocol_policy = "http-only"
#       origin_ssl_protocols   = ["TLSv1.2"]  
#   }
#   }
  
#   default_cache_behavior {
#     allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
#     cached_methods   = ["GET", "HEAD", "OPTIONS" ]
#     target_origin_id =  aws_lb.nlb.dns_name
#      viewer_protocol_policy = "redirect-to-https"

#       forwarded_values {
#         headers = []
#         query_string = true

#          cookies {
#             forward = "all"
#       }
#     }
#      min_ttl     = 0
#     default_ttl = 3600
#     max_ttl     = 86400
#     compress    = "true"
#   }
  
#   price_class = "PriceClass_100"

#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#     }    
#   }
  
#   retain_on_delete = "false"
 
#   viewer_certificate {
#     acm_certificate_arn = aws_acm_certificate.cert.arn
#     cloudfront_default_certificate = "false"
#     ssl_support_method = "sni-only"
#     minimum_protocol_version = "TLSv1.2_2021"
#   }

# }




  
