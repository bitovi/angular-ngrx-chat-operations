# SSL Certificate
resource "aws_acm_certificate" "ssl_certificate" {
  count = var.domain_name == null ? 0 : 1
  provider                  = aws
  domain_name               = var.domain_name
  subject_alternative_names = ["*.${var.domain_name}"]
  validation_method         = "EMAIL"
  #validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_validation" {
  provider        = aws
  certificate_arn = aws_acm_certificate.ssl_certificate[0].arn
}