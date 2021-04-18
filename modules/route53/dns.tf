resource "aws_route53_record" "this" {
  zone_id = var.dns_id
  name    = var.dns_domain_name
  type    = var.dns_type
  ttl     = var.dns_ttl
  records = [var.aws_instance_public_ip]
}