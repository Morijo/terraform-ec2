resource "aws_route53_record" "this" {
  zone_id = var.aws_dns_id
  name    = var.aws_dns_domain_name
  type    = var.aws_dns_type
  ttl     = var.aws_dns_ttl
  records = [var.aws_instance_public_ip]
}