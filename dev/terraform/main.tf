resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "aws_key" {
  key_name   = "${var.ops_repo_environment}-ssh-key"
  public_key = tls_private_key.key.public_key_openssh
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.ops_repo_environment}-profile"
  role = var.ec2_iam_instance_profile
}
resource "aws_instance" "server" {
  ami                         = var.aws_ami
  instance_type               = var.ec2_instance_type
  associate_public_ip_address = true
  security_groups             = [var.security_group_name]
  key_name                    = aws_key_pair.aws_key.key_name
  monitoring                  = true
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name

  tags = {
   Name = "${var.ops_repo_environment} - Instance"
  }
}

