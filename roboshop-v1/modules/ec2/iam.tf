resource "aws_iam_role" "main" {
  name = "${var.name}-${var.env}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      },
    ]
  })

  tags = {
    tag-key = "${var.name}-${var.env}-role"
  }
}

resource "aws_iam_instance_profile" "main" {
  name = "${var.name}-${var.env}-role"
  role = aws_iam_role.main.name
}