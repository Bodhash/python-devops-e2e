resource "aws_ecr_repository" "app" {
  name                 = "${var.project}-repo"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = { project = var.project }
}
