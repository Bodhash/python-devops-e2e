resource "aws_instance" "jenkins" {
  count         = var.create_jenkins_ec2 ? 1 : 0 
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name      = var.key_name

  iam_instance_profile = aws_iam_instance_profile.jenkins_profile.name

  vpc_security_group_ids = [
    aws_security_group.jenkins_sg.id
  ]

  tags = {
    Name = "jenkins-server"
  }
}

