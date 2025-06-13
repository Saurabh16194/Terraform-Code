# IAM Policy: Defines what the EC2 can do (e.g., access S3)
resource "aws_iam_role_policy_attachment" "iam-policy" {
  role = aws_iam_role.jenkins_role.name
  # Just for testing purpose, don't try to give administrator access
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}