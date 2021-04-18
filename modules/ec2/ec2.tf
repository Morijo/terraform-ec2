data "aws_ami" "this" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.this.id
  instance_type          = var.aws_instance_type
  iam_instance_profile   = aws_iam_instance_profile.this.name
  vpc_security_group_ids = [var.aws_security_group_id]
  subnet_id              = var.aws_subnet_public_id
  availability_zone      = "${var.aws_region}a"
  key_name               = aws_key_pair.this.key_name
  user_data              = file("scripts/commons.sh")
  tags = {
    Name = format("%s-ec2",var.project)
  }
}