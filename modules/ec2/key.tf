resource "aws_key_pair" "this" {
  key_name = "key_web"
  public_key = file(var.aws_key_path)
}
