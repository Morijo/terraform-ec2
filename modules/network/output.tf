output "aws_vpc" {
  value = aws_vpc.this.id
}

output "aws_security_group" {
  value = aws_security_group.this.id
}

output "aws_subnet_public" {
  value = aws_subnet.public.id
}

output "aws_subnet_private" {
  value = aws_subnet.private.id
}