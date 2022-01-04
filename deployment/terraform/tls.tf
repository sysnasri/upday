# The ACM certificate resource allows requesting and management of certificates 
# from the Amazon Certificate Manager.

resource "aws_acm_certificate" "upday-cert" {
  domain_name       = var.domain_name.fqdn
  validation_method = "DNS"

  tags = {
    Environment = "upday"
  }

  lifecycle {
    create_before_destroy = true
  }
}
# This resource represents a successful validation of 
# an ACM certificate in concert with other resources.

resource "aws_acm_certificate_validation" "upday" {
  certificate_arn         = aws_acm_certificate.upday-cert.arn
  validation_record_fqdns = [tolist(aws_acm_certificate.upday-cert.domain_validation_options)[0].resource_record_name]
}

