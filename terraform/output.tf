output "jenkins_public_ip" {
  value = aws_instance.jenkins[0].public_ip
}

