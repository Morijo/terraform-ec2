output "aws_instance" {
  value = {
    id             = aws_instance.this.id
    public_ip      = aws_instance.this.public_ip
    private_ip     = aws_instance.this.private_ip
  }
}

output "aws_key_pair" {
  value = aws_key_pair.this.key_name
}