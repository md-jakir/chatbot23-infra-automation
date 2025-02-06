resource "aws_iam_instance_profile" "bastion_instance_profile" {
  name = "bastion-instance-profile"
  role = var.bastion_host_role_arn
}

resource "aws_instance" "bastion_host" {
  ami           = var.bastion_ami_id # Replace with a valid AMI ID
  instance_type = var.instance_class
  subnet_id     = var.bastion_subnet_id
  associate_public_ip_address = true

  #security_groups = [aws_security_group.bastion_sg.name]

  iam_instance_profile = aws_iam_instance_profile.bastion_instance_profile.name

  tags = {
    Name = "Bastion Host"
  }
}
